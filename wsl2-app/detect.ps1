Write-Host "wsl2-app.detect.ps1: Sleeping for 20 seconds..."
Start-Sleep -Seconds 10

if (wsl --status) {
    Write-Host "wsl --status, WSL2 is installed."
    # Success
    exit 0
} 

Write-Host "wsl --status, WSL2 is not installed."
# Failure
exit 1
