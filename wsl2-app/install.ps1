Write-Host "wsl2-app.install.ps1: Sleeping for 20 seconds..."

try {
    Start-Sleep -Seconds 20
    Write-Host "Attempting to install WSL..."
    wsl --install
    if ($LASTEXITCODE -eq 0) {
        Write-Host "wsl --install, WSL installation completed successfully."
        # Success
        exit 0
    } else {
        Write-Error "wsl --install, installation failed with exit code $LASTEXITCODE."
        # Failure
        exit 1
    }
} catch {
    Write-Error "catch: An error occurred: $_"
    # Failure
    exit 1
} finally {
    Write-Host "finally: wsl2-app.install.ps1: Done."
    # Success
    exit 0
}
