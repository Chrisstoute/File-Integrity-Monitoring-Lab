# Day 3 - Attacker Tracker FIM Script

$monitorFolder = "monitored_files"
$baselineFile = "baseline_hashes.csv"
$logFile = "attacker_tracker_log.txt"
$interval = 5

$currentUser = "$env:USERDOMAIN\$env:USERNAME"
$hostname = $env:COMPUTERNAME

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

        $severity = "LOW"

        if ($entry.FileName -match "firewall|policy") {
            $severity = "HIGH"
        }
        elseif ($entry.FileName -match "users") {
            $severity = "MEDIUM"
        }

        if (!(Test-Path $entry.FilePath)) {
            $logEntry = [PSCustomObject]@{
    timestamp = (Get-Date -Format o)
    severity  = $severity
    user      = $currentUser
    host      = $hostname
    action    = "DELETED"
    file      = $entry.FileName
    old_hash  = $entry.Hash
} | ConvertTo-Json -Compress

            Write-Host "[!!!] $severity ALERT: File deleted: $($entry.FileName)" -ForegroundColor Red
            Write-Host "User: $currentUser"
            Write-Host "Host: $hostname"

            Add-Content -Path $logFile -Value $logEntry
            continue
        }

        $currentHash = (Get-FileHash $entry.FilePath -Algorithm SHA256).Hash

        if ($currentHash -ne $entry.Hash) {
            $logEntry = [PSCustomObject]@{
    timestamp = (Get-Date -Format o)
    severity  = $severity
    user      = $currentUser
    host      = $hostname
    action    = "MODIFIED"
    file      = $entry.FileName
    old_hash  = $entry.Hash
    new_hash  = $currentHash
} | ConvertTo-Json -Compress

            Write-Host "[!!!] $severity ALERT: File modified: $($entry.FileName)" -ForegroundColor Red
            Write-Host "User: $currentUser"
            Write-Host "Host: $hostname"
            Write-Host "Old Hash: $($entry.Hash)"
            Write-Host "New Hash: $currentHash"

            Add-Content -Path $logFile -Value $logEntry

            $entry.Hash = $currentHash
            $baseline | Export-Csv $baselineFile -NoTypeInformation
        }
        else {
            Write-Host "[OK] No change: $($entry.FileName)" -ForegroundColor Green
        }
    }
}