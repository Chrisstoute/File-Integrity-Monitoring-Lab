# Multi-File Integrity Monitoring Script

$monitorFolder = "monitored_files"
$baselineFile = "baseline_hashes.csv"
$logFile = "multi_fim_log.txt"
$interval = 5

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

# Load baseline hashes
$baseline = Import-Csv $baselineFile

Write-Host "[*] Monitoring folder for file changes..." -ForegroundColor Yellow
Write-Host "[*] Folder: $monitorFolder" -ForegroundColor Yellow

while ($true) {

    Start-Sleep -Seconds $interval

    foreach ($entry in $baseline) {

        if (!(Test-Path $entry.FilePath)) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $logEntry = "$timestamp | HIGH | File deleted: $($entry.FileName)"

            Write-Host "[!!!] HIGH ALERT: File deleted: $($entry.FileName)" -ForegroundColor Red
            Add-Content -Path $logFile -Value $logEntry
            continue
        }

        $currentHash = (Get-FileHash $entry.FilePath -Algorithm SHA256).Hash

        if ($currentHash -ne $entry.Hash) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $logEntry = "$timestamp | HIGH | File modified: $($entry.FileName) | Old Hash: $($entry.Hash) | New Hash: $currentHash"

            Write-Host "[!!!] HIGH ALERT: File modified: $($entry.FileName)" -ForegroundColor Red
            Write-Host "Old Hash: $($entry.Hash)"
            Write-Host "New Hash: $currentHash"

            Add-Content -Path $logFile -Value $logEntry
        }
        else {
            Write-Host "[OK] No change: $($entry.FileName)" -ForegroundColor Green
        }
    }
}