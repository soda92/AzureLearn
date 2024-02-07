$resourceGroupName = "Readiness_Day11"
$location = "eastus"
New-AzResourceGroup -Name $resourceGroupName -Location $location


$vmName = "Ubuntu20-04-LTS"

New-AzVM -ResourceGroupName $resourceGroupName -Name "$vmName" `
    -Location $location -Image `
    "Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest" `
    -Size "Standard_B1s" `
    -VirtualNetworkName "$vmName-vnet" `
    -SubnetName "$vmName-Subnet" `
    -SecurityGroupName "$vmName-nsg" `
    -PublicIpAddressName "$vmName-public-ip" `
    -OpenPorts 22


$vmName = "win2022"

New-AzVM -ResourceGroupName $resourceGroupName -Name "$vmName" `
    -Location $location -Image `
    "MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest" `
    -Size "Standard_B2s" `
    -VirtualNetworkName "$vmName-vnet" `
    -SubnetName "$vmName-Subnet" `
    -SecurityGroupName "$vmName-nsg" `
    -PublicIpAddressName "$vmName-public-ip" `
    -OpenPorts 3389


