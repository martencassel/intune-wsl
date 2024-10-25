try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append
    dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux /norestart
    dism.exe /online /disable-feature /featurename:VirtualMachinePlatform /norestart
    exit 1641
} catch {
    Write-Error "Failed to uninstall WSL2"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}
