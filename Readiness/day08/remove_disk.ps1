$resourceGroupName = 'Readiness_Day8-9'
for ($i = 1; $i -le 7; $i = $i + 1) {
    $diskName = "test$i"
    Remove-AzDisk -ResourceGroupName $resourceGroupName -DiskName $diskName -Force
}
