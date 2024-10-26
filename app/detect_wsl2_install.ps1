$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
$vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

if ($wslFeature.State -eq "Enabled" -and $vmPlatformFeature.State -eq "Enabled") {
    Write-Output "WSL2 is installed and configured correctly."
    exit 0
} else {
    Write-Output "WSL2 is not installed or not configured correctly."
    exit 1
}