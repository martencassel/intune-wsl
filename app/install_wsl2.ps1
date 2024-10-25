
try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart
    exit 1641
} catch {
    Write-Error "Failed to install WSL2"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}

