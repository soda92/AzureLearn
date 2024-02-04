$subscriptionId = "89c60b7b-9d90-4133-a61f-f8d064c775d5"
$resourceGroupName = "Readiness_Day8-9"

$storageAccountName = "myq234832432"
$location = "eastus"

$storageAccoundId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$storageAccountName"

Set-AzContext -Subscription $subscriptionId

function CreateDisk {
    param (
        $vhdFileName,
        $diskName
    )
    $vhdUri = "https://$storageAccountName.blob.core.windows.net/vhds/$vhdFileName"

    $diskSize = '128'
    $sku = "Standard_LRS"
    $zoneId = 1

    $diskConfig = New-AzDiskConfig -SkuName $sku -Location $location -DiskSizeGB $diskSize `
    -SourceUri $vhdUri -StorageAccountId $storageAccoundId -CreateOption Import -Zone $zoneId `
    -OsType Windows -HyperVGeneration V1

    New-AzDisk -DiskName $diskName -Disk $diskConfig -ResourceGroupName $resourceGroupName
}

for ($i = 1; $i -le 1; $i = $i + 1) {
    $vhdFileName = "Test$i.vhd"
    $diskName = "Test$i"
    CreateDisk -vhdFileName $vhdFileName -diskName $diskName
}