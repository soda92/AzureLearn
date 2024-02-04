$resourceGroupName = "Readiness_Day10"

New-AzResourceGroup -Name $resourceGroupName -Location "eastus"
New-AzVM -ResourceGroupName $resourceGroupName -Name "Vm1" `
    -Location northeurope -Image `
    'Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest' `
    -VirtualNetworkName 'Vm1-vnet' `
    -SubnetName 'Vm1-Subnet' `
    -SecurityGroupName 'Vm1-nsg' `
    -PublicIpAddressName 'Vm1-public-ip' `
    -OpenPorts 22
