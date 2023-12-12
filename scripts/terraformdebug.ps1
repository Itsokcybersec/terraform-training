$env:TF_LOG='TRACE'
$env:TF_LOG_PATH="SPSScriptRoot/logs/terraform.log" #The SPSScriptRoot is a built-in variable in PowerShell that points to the current script directory.

terraform apply -auto-approve