$resourceGroupName = "Readiness_Day8"
$location = "japaneast"
New-AzResourceGroup -Name $resourceGroupName -Location $location

$vmName = 'NestedHyperV'

New-AzVM -ResourceGroupName $resourceGroupName -Name $vmName `
    -Location $location -Image `
    'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
    -Size "Standard_D4s_v5" `
    -VirtualNetworkName "$vmName-vnet" `
    -SubnetName "$vmName-Subnet" `
    -SecurityGroupName "$vmName-nsg" `
    -PublicIpAddressName "$vmName-public-ip" `
    -OSDiskDeleteOption Delete `
    -NetworkInterfaceDeleteOption Delete `
    -OpenPorts 3389

Invoke-AzVMRunCommand -ResourceGroupName $resourceGroupName -VMName $vmName `
    -CommandId "RunPowerShellScript" `
    -ScriptString 'Install-WindowsFeature -Name Hyper-V -IncludeAllSubFeature -IncludeManagementTools'

Restart-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
