# Check if current is local administrator.
#
# Returns: true or false
function Test-IsAdmin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Run exec command.
#
# Success or failure message (with exception)
function Run-Command {
    param (
        [string]$commandText
    )
    try {
        & $commandText
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to run the command: $commandText"
        }
        Write-Host "Command executed successfully: $commandText"
    } catch {
        Write-Error "An error occurred while running the command: $commandText"
    }
}


function Disable-Feature {
    param (
        [string]$FeatureName
    )
    Disable-WindowsOptionalFeature -Online -FeatureName $FeatureName -NoRestart
    $feature = Get-WindowsFeature -FeatureName $FeatureName
    if ($feature.State -eq "Disabled") {
        throw "Failed to enable $FeatureName: $FeatureName feature is still disabled."
    }
}

try {
    $LogPath = "C:\temp\wsl_installer.log"
    Start-Transcript -Path $LogPath -Append

    if (-not (Test-IsAdmin)) {
        throw "This script must be run as an administrator."
    }

    # WSL1 support
    Disable-Feature -FeatureName Microsoft-Windows-Subsystem-Linux

    # WSL2  uninstall, requires admin privileges.
    Run-Command "wsl --uninstall"
  
    Restart-System
} catch {
    Write-Error "Failed to install WSL2 $_"

    # 1: Generic failure
    exit 1
} finally {
    Stop-Transcript -ErrorAction SilentlyContinue
}
