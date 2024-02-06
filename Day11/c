$resourceGroupName = "Readiness_Day11"

New-AzResourceGroup -Name $resourceGroupName -Location "eastus"

$vmName = "Ubuntu20.04-LTS"

New-AzVM -ResourceGroupName $resourceGroupName -Name "$vmName" `
    -Location northeurope -Image `
    "Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest" `
    -VirtualNetworkName "$vmName-vnet" `
    -SubnetName "$vmName-Subnet" `
    -SecurityGroupName "$vmName-nsg" `
    -PublicIpAddressName "$vmName-public-ip" `
    -OpenPorts 22


$vmName = "WindowsServer2022"


