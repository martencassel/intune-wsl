# try {
#     $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
#     $wslFeatureEnabled = $wslFeature | Select-Object -ExpandProperty State

#     $vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
#     $vmPlatformFeatureEnabled = $vmPlatformFeature | Select-Object -ExpandProperty State

#     if ( ($wslFeatureEnabled -eq "Enabled") -and ($vmPlatformFeatureEnabled -eq "Enabled") ) {
#         Write-Host "WSL2 is installed and configured correctly."
#         exit 0
#     } 

#     $ErrMsg = "Not all features are enabled: "

#     if ($wslFeatureEnabled -ne "Enabled") {
#         $ErrMsg = "wslFeatureEnabled is not enabled"
#     }

#     if ($vmPlatformFeatureEnabled -ne "Enabled") {
#         $ErrMsg = $ErrMsg + " vmPlatformFeatureEnabled is not enabled"
#     }

#     Write-Host $ErrMsg
#     exit 1

# } catch {
#     Write-Error "Failed to detect WSL2 installation: $_"
#     exit 1
# }
Write-Host "Installed"
exit 0
