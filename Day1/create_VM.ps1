Connect-AzAccount

New-AzResourceGroup -Name Readiness_Day1 -Location 'Central India'
New-AzVM -ResourceGroupName Readiness_Day1 -Name "Vm1" `
    -Location northeurope -Image `
    'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
    -VirtualNetworkName 'Vm1-vnet' `
    -SubnetName 'Vm1-Subnet' `
    -SecurityGroupName 'Vm1-nsg' `
    -PublicIpAddressName 'Vm1-public-ip' `
    -OpenPorts 80,3389

Invoke-AzVMRunCommand -ResourceGroupName Readiness_Day1 -VMName Vm1 `
    -CommandId "RunPowerShellScript" `
    -ScriptString 'Install-WindowsFeature -Name Web-Server -IncludeManagementTools'
