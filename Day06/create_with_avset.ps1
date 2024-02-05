$resourcegroup = "Readiness_Day6"
$location = "westus"

New-AzResourceGroup -Name $resourcegroup -Location $location

$oldAvsetName = "avset1"

$oldAvset = New-AzAvailabilitySet `
-Location $location `
-Name $oldAvsetName `
-ResourceGroupName $resourcegroup `
-PlatformFaultDomainCount 2 `
-PlatformUpdateDomainCount 2 `
-Sku Aligned

$vmName = "Day6lab1"

$vm = New-AzVM -ResourceGroupName $resourcegroup -Name $vmName `
    -Location $location -Image `
    'Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest' `
    -VirtualNetworkName 'Vm1-vnet' `
    -SubnetName 'Vm1-Subnet' `
    -SecurityGroupName 'Vm1-nsg' `
    -PublicIpAddressName 'Vm1-public-ip' `
    -OSDiskDeleteOption Detach `
    -NetworkInterfaceDeleteOption Detach `
    -Size "Standard_B1s" `
    -OpenPorts 22 `
    -AvailabilitySetName $oldAvsetName
