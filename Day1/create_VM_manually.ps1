$resourcegroup = "Readiness_Day1"
$location = "northeurope"

$storageAccountName = "storage4835723923"

Connect-AzAccount

New-AzStorageAccount -Name $storageAccountName -ResourceGroupName $resourcegroup `
    -SkuName Standard_LRS -Location $location

$vnetName = "testnet"

$subnet = New-AzVirtualNetworkSubnetConfig -Name 'frontSubnet' -AddressPrefix '10.0.1.0/24'
$vnet = New-AzVirtualNetwork -name $vnetName -ResourceGroupName $resourcegroup `
    -Location $location -AddressPrefix '10.0.0.0/16' -Subnet $subnet

$nicname = 'testvm-nic'

$pip = New-AzPublicIpAddress -name $nicname -ResourceGroupName $resourcegroup -Location $location `
    -AllocationMethod Static
$nic = New-AzNetworkInterface -Name $nicname -ResourceGroupName $resourcegroup -Location $location `
    -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id

$vmName = "testvm1"
$cred = Get-Credential -Message "Admin credentials"

$diskName = "os-disk"
$storageAcc = Get-AzStorageAccount -ResourceGroupName $resourcegroup -Name $storageAccountName
$osDiskUri = $storageAcc.PrimaryEndpoints.Blob.ToString() + "vhds/" + $diskName + ".vhd"

$vm = New-AzVMConfig -VMName $vmName -VMSize "Standard_B2s" `
    | Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $cred -ProvisionVMAgent -EnableAutoUpdate `
    | Set-AzVMSourceImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2022-datacenter-azure-edition" -Version "latest"`
    | Add-AzVMNetworkInterface -Id $nic.Id `
    | Set-AzVMOSDisk -Name $diskName -VhdUri $osDiskUri -CreateOption 'fromImage'

New-AzVM -ResourceGroupName $resourcegroup -Location $location -VM $vm
