$nsg = Get-AzNetworkSecurityGroup -Name Vm1-nsg -ResourceGroupName Readiness_Day1
Get-AzNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg | format-table Name, Protocol, Access, Priority, Direction, SourcePortRange, DestinationPortRange, SourceAddressPrefix, DestinationAddressPrefix

# Remove-AzNetworkSecurityRuleConfig -Name Vm1-nsg80 -NetworkSecurityGroup $nsg
# ## Updates the network security group. ##
# Set-AzNetworkSecurityGroup -NetworkSecurityGroup $nsg

Add-AzNetworkSecurityRuleConfig -Name Vm1-nsg80 -NetworkSecurityGroup $nsg `
    -Description "allow-IIS" -Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
    -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 80

Set-AzNetworkSecurityGroup -NetworkSecurityGroup $nsg