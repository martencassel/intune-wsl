try {
    dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
    dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
    wsl --uninstall
    exit 1641
} catch {
    Write-Error "Failed to uninstall WSL2"
    exit 1
}