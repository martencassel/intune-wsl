try {
    Remove-Item c:\from_intune.txt
} catch {
    Write-Debug $_
    exit 1
} finally {
    # Success
    exit 0
}
