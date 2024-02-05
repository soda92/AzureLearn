$subscriptionId = (Get-AzSubscription)[0].Id
$resourceGroupName = "Readiness_Day8"
$location = "japaneast"
New-AzResourceGroup -Name $resourceGroupName -Location $location

$storageAccountName = "myq2348324321"

$storageAccoundId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$storageAccountName"

Set-AzContext -Subscription $subscriptionId

function CreateDisk {
    param (
        $vhdFileName,
        $diskName
    )
    $vhdUri = "https://$storageAccountName.blob.core.windows.net/vhds/$vhdFileName"

    $diskSize = '128'
    $sku = "Premium_LRS"

    $diskConfig = New-AzDiskConfig -SkuName $sku -Location $location -DiskSizeGB $diskSize `
    -SourceUri $vhdUri -StorageAccountId $storageAccoundId -CreateOption Import `
    -OsType Windows -HyperVGeneration V1

    New-AzDisk -DiskName $diskName -Disk $diskConfig -ResourceGroupName $resourceGroupName
}

for ($i = 1; $i -le 7; $i = $i + 1) {
    $vhdFileName = "Test$i.vhd"
    $diskName = "Test$i"
    CreateDisk -vhdFileName $vhdFileName -diskName $diskName
}
