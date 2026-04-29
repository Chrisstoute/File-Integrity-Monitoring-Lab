<div align="center">

# 🛡️ File Integrity Monitoring Lab Walkthrough

### 🔍 PowerShell-Based File Integrity Monitoring

<img src="https://img.shields.io/badge/FIM-SHA256-green?style=for-the-badge">
<img src="https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/SOC-Detection-pink?style=for-the-badge">

</div>

---

# 🟢 Day 1 — Basic Hashing and Single-File Monitoring

## 🎯 Goal

Create a basic File Integrity Monitoring script that monitors one critical file and detects changes using SHA256 hashing.

---

## 🧱 Step 1 — Create the Project Folder

```powershell
cd $HOME\Documents
mkdir HashLab
cd HashLab
```

## 📄 Step 2 — Create a Critical Configuration File

```powershell
notepad system_config.txt
```

![](screenshots/1.%20Making%20HashLab%20Directory.jpg)

Example file contents:
```powershell
# System Configuration File
Firewall=Enabled
Antivirus=Enabled
AutoUpdates=Enabled
RemoteAccess=Disabled
```

## 🔐 Step 3 — Generate a Baseline Hash

```powershell
notepad system_config.txt
```
![](screenshots/2.%20Getting%20Baseline%20Hash.jpg)

![](screenshots/3.%20Updated%20from%20Disabled%20to%20Enabled.jpg)

![](screenshots/4.%20Updated%20Hash.jpg)

## 🛠️ Step 4 — Create the FIM Script

```powershell
notepad fim_monitor.ps1
```

![](screenshots/5.%20Creating%20File%20Integrity%20Monitoring%20Script.jpg)

## ▶️ Step 5 — Run the Script

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\fim_monitor.ps1
```

![](screenshots/6.%20Running%20FIM%20Script.jpg)

## 🚨 Step 6 — Simulate File Tampering
Modify system_config.txt:

```powershell
RemoteAccess=Enabled
```

![](screenshots/7.%20Simulated%20Attack.jpg)

## 🧾 Step 7 — Add Logging
The script was upgraded to write alerts to:

```powershell
2026-04-28 09:27:00 | ALERT | File modified: system_config.txt | Old Hash: ... | New Hash: ...
```

## 🧠 Skills Demonstrated (Day 1)

- SHA256 Hashing
- PowerShell Scripting
- File Integrity Monitoring (FIM)
- Baseline Creation
- File Tampering Detection
- Basic Security Logging