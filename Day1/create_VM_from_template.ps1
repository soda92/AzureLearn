New-AzResourceGroupDeployment -TemplateFile $PSScriptRoot\template.json -ResourceGroupName Readiness_Day1

# Redeploy: 
# remove imageReference from storageProfile, change createOption to Attach, remove osProfile 
# if changed VM name, need to copy original disk name back