Start-Transcript "C:\install-wsl2.log" -Append
Write-Host "wsl2-app.detect.ps1: Sleeping for 5 seconds..."
Start-Sleep -Seconds 5

if (&"c:\windows\system32\wsl.exe" --status) {
    Write-Host "wsl --status, WSL2 is installed."
    # Success
    exit 0
} 

Write-Host "wsl --status, WSL2 is not installed."
# Failure
Stop-Transcript
exit 1
