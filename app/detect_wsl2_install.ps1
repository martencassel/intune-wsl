$wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
$wslFeatureEnabled = $wslFeature | Select-Object -ExpandProperty State

$vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
$vmPlatformFeatureEnabled = $vmPlatformFeature | Select-Object -ExpandProperty State


if ( ($wslFeatureEnabled -eq "Enabled") -and ($vmPlatformFeatureEnabled -eq "Enabled") ) {
    Write-Output "WSL2 is installed and configured correctly."
    exit 0
} 

$ErrMsg = ""

if ($wslFeatureEnabled -ne "Enabled") {
    $ErrMsg = "wslFeatureEnabled is not enabled"
}

if ($vmPlatformFeatureEnabled -ne "Enabled") {
    $ErrMsg = $ErrMsg + " vmPlatformFeatureEnabled is not enabled"
}

Write-Output $ErrMsg
exit 1