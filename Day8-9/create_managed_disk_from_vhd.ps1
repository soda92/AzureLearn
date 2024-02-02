$subscriptionId = "89c60b7b-9d90-4133-a61f-f8d064c775d5"
$resourceGroupName = "Readiness_Day8-9"
$diskSize = '128'

$storageAccountName = "myq234832432"
$storageAccoundId = "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$storageAccountName"

$sku = "Premium_LRS"
$location = "eastus"

Set-AzContext -Subscription $subscriptionId

function CreateDisk {
    param (
        $vhdFileName,
        $diskName
    )
    $vhdUri = "https://myq234832432.blob.core.windows.net/vhds/$vhdFileName"
    $diskConfig = New-AzDiskConfig -SkuName $sku -Location $location -DiskSizeGB $diskSize -SourceUri $vhdUri -StorageAccountId $storageAccoundId -CreateOption Import

    New-AzDisk -DiskName $diskName -Disk $diskConfig -ResourceGroupName $resourceGroupName
}

for ($i = 1; $i -le 7; $i = $i + 1) {
    $vhdFileName = "Test$i.vhd"
    $diskName = "Test$i"
    CreateDisk -vhdFileName $vhdFileName -diskName $diskName
}