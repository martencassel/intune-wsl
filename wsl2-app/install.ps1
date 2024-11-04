Start-Transcript "C:\install-wsl2.log" -Append
Write-Host "wsl2-app.install.ps1: Sleeping for 5 seconds..."

try {
    Start-Sleep -Seconds 5
    Write-Host "Attempting to install WSL..."
    wsl --install --no-distribution
    if ($LASTEXITCODE -eq 0) {
        Write-Host "wsl --install, WSL installation completed successfully."
        Stop-Transcript
        # Success
        exit 0
    } else {
        Write-Error "wsl --install, installation failed with exit code $LASTEXITCODE."
        Stop-Transcript
        # Failure
        exit 1
    }
    Write-Host "install.ps1: Asking intune for a soft-reboot"
    exit 3010
} catch {
    Write-Error "catch: An error occurred: $_"
    Stop-Transcript
    # Failure
    exit 1
} finally {
    Write-Host "finally: wsl2-app.install.ps1: Done."
    Stop-Transcript
    # Success
    exit 0
}
Stop-Transcript