$rgName = "Readiness_Day3"
$vmName = "testvm1"

$vm = Get-AzVM -ResourceGroupName $rgName -Name $vmName
Stop-AzVM -ResourceGroupName $rgName -Name $vmName
$vm.StorageProfile.OsDisk.DiskSizeGB = 50
Update-AzVM -ResourceGroupName $rgName -VM $vm
