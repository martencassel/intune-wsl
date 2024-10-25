
try {
$LogPath = "C:\temp\wsl2_install.log"
Start-Transcript -Path $LogPath -Append

    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /restart
    exit 1641
} catch {
    Write-Error "Failed to install WSL2"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}

