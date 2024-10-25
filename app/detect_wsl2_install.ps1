try {
    $LogDir = "C:\temp"
    $LogPath = "$LogDir\wsl2_install.log"

    # Ensure log directory exists
    if (-not (Test-Path -Path $LogDir)) {
        New-Item -Path $LogDir -ItemType Directory -Force
    }
    Start-Transcript -Path $LogPath -Append

    $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    $vmPlatformFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

    Write-Host $wslFeature
    Write-Host $vmPlatformFeature

    $wslInstalled = $false
    $vmPlatformInstalled = $false

    if ($wslFeature.State -eq "Enabled") {
        Write-Output "Windows Subsystem for Linux is installed."
        $wslInstalled = $true
    } else {
        Write-Output "Windows Subsystem for Linux is not installed."
    }

    if ($vmPlatformFeature.State -eq "Enabled") {
        Write-Output "Virtual Machine Platform is installed."
        $vmPlatformInstalled = $true
    } else {
        Write-Output "Virtual Machine Platform is not installed."
    }

    if ($wslInstalled -and $vmPlatformInstalled) {
        Write-Output "WSL2 is installed and configured correctly."
        exit 0
    } else {
        Write-Output "WSL2 is not installed or not configured correctly."
        exit 1
    }

} catch {
    Write-Error "Failed to detect WSL2 installation: $_"
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}