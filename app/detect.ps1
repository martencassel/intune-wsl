function Exit-AppPresent {
    Write-Host "Application is present"
    Stop-Transcript
    exit 0
}

function Exit-AppNotPresent {
    Write-Host "Application is not present"
    Stop-Transcript
    exit 1
}

function Main {
    $LogPath = "C:\temp\install.log"
    if (-not (Test-Path -Path "C:\temp")) {
        New-Item -Path "C:\temp" -ItemType Directory -Force
    }
    Start-Transcript -Path $LogPath -Append

    $wslFeature = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    $vmpFeature = Get-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    $Detected = $wslFeature.State -eq "Enabled"
    $Detected = $Detected -and ($vmpFeature.State -eq "Enabled")
    if ($Detected) {
        Exit-AppPresent
    } else {
        Exit-AppNotPresent
    }
    Stop-Transcript
}

try {
    Main
} catch {
    Write-Error "Failed to detect WSL2 installation: $_"
    exit 1
}
 