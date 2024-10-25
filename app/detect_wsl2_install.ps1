$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
$vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

if ($wslFeature.State -eq "Enabled" -and $vmPlatformFeature.State -eq "Enabled") {
    Write-Output "Windows Subsystem for Linux is installed and configured correctly with Virtual Machine Platform."
    exit 0
} else {
    Write-Output "Windows Subsystem for Linux is not installed or configured correctly with Virtual Machine Platform."
    exit 1
}