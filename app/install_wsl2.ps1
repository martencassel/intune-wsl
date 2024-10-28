try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append
    Write-Host "Installing Microsoft-Windows-Subsystem-Linux to enable WS1 support"
    $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    if ($wslFeature.State -eq "Enabled") {
        Write-Host "Windows Subsystem for Linux is already installed."
    } else {
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
        Write-Host "Windows Subsystem for Linux installed successfully."
    }
    $vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    if ($vmPlatformFeature.State -eq "Enabled") {
        Write-Host "Virtual Machine Platform is already installed."
    } else {
        Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart
        Write-Host "Virtual Machine Platform installed successfully."
    }
    Write-Output "Returning exit code 1641 to trigger a restart by Intune."
    exit 1641
} catch {
    Write-Error "Failed to install WSL2 $_"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}

