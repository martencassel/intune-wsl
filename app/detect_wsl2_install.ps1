$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
$vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

$vmPlatformIsEnabled = $($vmPlatformFeature.State -eq "EnablePending") -or ($vmPlatformFeature.State -eq "Enabled")
$wslFeatureIsEnabled = $wslFeature.State -eq "Enabled"

if ($wslFeatureIsEnabled -and $vmPlatformIsEnabled) {
    Write-Output "Windows Subsystem for Linux is installed and configured correctly with Virtual Machine Platform."
    exit 0
} else {
    Write-Output "Windows Subsystem for Linux is not installed or configured correctly with Virtual Machine Platform."
    exit 1
}