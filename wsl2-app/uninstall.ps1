Start-Transcript "C:\install-wsl2.log" -Append
Write-Host "wsl2-app.uninstall.ps1: Sleeping for 5 seconds..."
Start-Sleep -Seconds 5

try {
    Write-Host "Attempting to uninstall WSL..." 
    # Will prompt for 60 seconds and exit.
    & "c:\windows\system32\wsl.exe" --uninstall
    if ($LASTEXITCODE -eq 0) {
        Write-Host "WSL uninstallation completed successfully."
        exit 0
    } else {
        Write-Error "WSL uninstallation failed with exit code $LASTEXITCODE."
        exit 1
    }
} catch {
    Write-Error "An error occurred: $_"
    Stop-Transcript
    exit 1
}