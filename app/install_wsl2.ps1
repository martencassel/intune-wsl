try {
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    exit 1641
} catch {
    Write-Error "Failed to install WSL2"
    exit 1
}

