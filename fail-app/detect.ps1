Write-Host "detect.ps1: Sleeping for 20 seconds..."
Start-Sleep -Seconds 10
throw "detect.ps1: Failing on purpose"
# Fail
exit 1