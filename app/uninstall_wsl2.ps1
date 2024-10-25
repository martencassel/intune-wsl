try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append
    Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
    exit 1641
} catch {
    Write-Error "Failed to uninstall WSL2: $_"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}
