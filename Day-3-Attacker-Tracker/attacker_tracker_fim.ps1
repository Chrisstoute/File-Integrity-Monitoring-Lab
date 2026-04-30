# Day 3 - Attacker Tracker FIM Script

$monitorFolder = "monitored_files"
$baselineFile = "baseline_hashes.csv"
$logFile = "attacker_tracker_log.txt"
$interval = 5

# Current user context
$currentUser = "$env:USERDOMAIN\$env:USERNAME"
$hostname = $env:COMPUTERNAME

# Create baseline if it does not exist
if (!(Test-Path $baselineFile)) {

    Write-Host "[+] Creating baseline hashes..." -ForegroundColor Green

    Get-ChildItem $monitorFolder -File | ForEach-Object {
        $hash = Get-FileHash $_.FullName -Algorithm SHA256

        [PSCustomObject]@{
            FileName = $_.Name
            FilePath = $_.FullName
            Hash     = $hash.Hash
        }
    } | Export-Csv $baselineFile -NoTypeInformation

    Write-Host "[+] Baseline created: $baselineFile" -ForegroundColor Green
    Write-Host "[*] Run the script again to start monitoring." -ForegroundColor Yellow
    exit
}

$baseline = Import-Csv $baselineFile

Write-Host "[*] Attacker Tracker FIM started..." -ForegroundColor Yellow
Write-Host "[*] Monitoring folder: $monitorFolder" -ForegroundColor Yellow
Write-Host "[*] Running as user: $currentUser" -ForegroundColor Cyan
Write-Host "[*] Hostname: $hostname" -ForegroundColor Cyan

while ($true) {

    Start-Sleep -Seconds $interval

    foreach ($entry in $baseline) {

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        if (!(Test-Path $entry.FilePath)) {

            $logEntry = "$timestamp | HIGH | User: $currentUser | Host: $hostname | Action: Deleted | File: $($entry.FileName)"

            Write-Host "[!!!] HIGH ALERT: File deleted: $($entry.FileName)" -ForegroundColor Red
            Write-Host "User: $currentUser"
            Write-Host "Host: $hostname"

            Add-Content -Path $logFile -Value $logEntry
            continue
        }

        $currentHash = (Get-FileHash $entry.FilePath -Algorithm SHA256).Hash

        if ($currentHash -ne $entry.Hash) {

            $logEntry = "$timestamp | HIGH | User: $currentUser | Host: $hostname | Action: Modified | File: $($entry.FileName) | Old Hash: $($entry.Hash) | New Hash: $currentHash"

            Write-Host "[!!!] HIGH ALERT: File modified: $($entry.FileName)" -ForegroundColor Red
            Write-Host "User: $currentUser"
            Write-Host "Host: $hostname"
            Write-Host "Old Hash: $($entry.Hash)"
            Write-Host "New Hash: $currentHash"

            Add-Content -Path $logFile -Value $logEntry

# 🔥 Update baseline so it doesn't spam alerts
$entry.Hash = $currentHash
$baseline | Export-Csv $baselineFile -NoTypeInformation
        }
        else {
            Write-Host "[OK] No change: $($entry.FileName)" -ForegroundColor Green
        }
    }
}