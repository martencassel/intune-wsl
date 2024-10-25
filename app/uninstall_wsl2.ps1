try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append

    # Check for pending restart
    $pendingRestart = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -ErrorAction SilentlyContinue)
    if ($pendingRestart) {
        Write-Output "A pending restart is detected. Please restart the system and run the script again."
        exit 1
    }

    # Disable VirtualMachinePlatform 
    Disable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
    $vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    if ($vmPlatformFeature.State -eq "Enabled") {
        throw "Failed to uninstall WSL2: VirtualMachinePlatform feature is still enabled."
    }

    # Disable Microsoft-Windows-Subsystem-Linux
    Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
    $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    if ($wslFeature.State -eq "Enabled") {
        throw "Failed to uninstall WSL2: Microsoft-Windows-Subsystem-Linux feature is still enabled."
    }
    Write-Output "WSL2 uninstalled successfully."
    Write-Output "Returning exit code 1641 to trigger a restart by Intune."
    exit 1641
} catch {
    Write-Error "Failed to uninstall WSL2: $_"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}
