
try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append

    # Check for pending restart
    $pendingRestart = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -ErrorAction SilentlyContinue)
    if ($pendingRestart) {
        Write-Output "A pending restart is detected. Please restart the system and run the script again."
        Write-Output "Returning exit code 1 to indicate a pending restart."
        exit 1
    }

    $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    if ($wslFeature.State -eq "Enabled") {
        Write-Output "Windows Subsystem for Linux is already installed."
    } else {
        Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -NoRestart
        Write-Output "Windows Subsystem for Linux installed successfully."
    }

    $vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    if ($vmPlatformFeature.State -eq "Enabled") {
        Write-Output "Virtual Machine Platform is already installed."
    } else {
        Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All -NoRestart
        Write-Output "Virtual Machine Platform installed successfully."
    }

    Write-Output "Returning exit code 1641 to trigger a restart by Intune."
    exit 1641
} catch {
    Write-Error "Failed to install WSL2 $_"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}

