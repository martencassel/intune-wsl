try {
    $LogPath = "C:\temp\wsl2_install.log"
    Start-Transcript -Path $LogPath -Append

    $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    $vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

    # How do we check if these features are enabled?
    if ($wslFeature.State -eq "Enabled" -and $vmPlatformFeature.State -eq "Enabled") {
        Write-Output "Windows Subsystem for Linux is installed and configured with Virtual Machine Platform."
        exit 0
    } else {
        Write-Output "Windows Subsystem for Linux and Virtual Machine Platform are not installed."
        exit 1
    }
} catch {
    Write-Error "Failed to install WSL2"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}

