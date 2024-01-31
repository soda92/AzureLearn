$rgName = "Readiness_Day3"
$location = "centralindia"

$nsgName = "testvm1-nsg"

$nsg = New-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rgName -Location $location

Add-AzNetworkSecurityRuleConfig -Name "allow_22" -NetworkSecurityGroup $nsg -Priority 100 `
-Description "allow ssh access" -Protocol Tcp -SourcePortRange * -DestinationPortRange 22 `
-SourceAddressPrefix * -DestinationAddressPrefix * -Direction Inbound -Access Allow

$nsg | Set-AzNetworkSecurityGroup
$vnet = (Get-AzVirtualNetwork -ResourceGroupName $rgName)[0]
Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $vnet.Subnets[0].Name -NetworkSecurityGroupId $nsg.Id -AddressPrefix "10.0.1.0/24"
$vnet | Set-AzVirtualNetwork