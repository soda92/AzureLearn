$resourcegroup = "Readiness_Day6"
$location = "westus"

$vmName = "Day6lab1"

$vm = Get-AzVM -ResourceGroupName $resourcegroup -Name $vmName
Remove-AzVM -ResourceGroupName $resourcegroup -Name $vmName

$newAvsetName = "avset2"

$newAvset = New-AzAvailabilitySet `
-Location $location `
-Name $newAvsetName `
-ResourceGroupName $resourcegroup `
-PlatformFaultDomainCount 2 `
-PlatformUpdateDomainCount 2 `
-Sku Aligned



$newVM = New-AzVMConfig `
    -VMName $vm.Name -VMSize $vm.HardwareProfile.VmSize `
    -AvailabilitySetId $newAvset.Id

Set-AzVMOSDisk -VM $newVM -CreateOption Attach `
    -ManagedDiskId $vm.StorageProfile.OsDisk.ManagedDisk.Id `
    - name $vm.StorageProfile.OsDisk.Name `
    -Linux

Add-AzVMNetworkInterface -VM $newVM -Id $vm.NetworkProfile.NetworkInterfaces[0].Id -Primary

New-AzVM -ResourceGroupName $resourcegroup `
    -Location $location `
    -VM $newVM -DisableBginfoExtension
