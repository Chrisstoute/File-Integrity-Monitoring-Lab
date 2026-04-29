<div align="center">

# 🛡️ File Integrity Monitoring Lab Walkthrough

### 🔍 PowerShell-Based File Integrity Monitoring

<img src="https://img.shields.io/badge/FIM-SHA256-green?style=for-the-badge">
<img src="https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/SOC-Detection-pink?style=for-the-badge">

</div>

---



<<<<<<< HEAD
# 🔵 Day 2 — Multi-File Monitoring



## 🎯 Goal
=======




---







# 🔵 Day 2 — Multi-File Monitoring







## 🎯 Goal
>>>>>>> 4bb28af (Added walkthroughs and added screenshots)







Enhance the File Integrity Monitoring system to monitor \\\*\\\*multiple files simultaneously\\\*\\\*, store baseline hashes in a structured format, and detect changes across an entire directory.







---




## 📁 Step 1 — Create Day 2 Project Structure





## 📁 Step 1 — Create Day 2 Project Structure








```powershell



cd $HOME\\\\Documents\\\\HashLab







mkdir Day-2-Multi-File-Monitoring



cd Day-2-Multi-File-Monitoring







mkdir monitored\\\_files



cd monitored\\\_files







```




## 📄 Step 2 — Create Files to Monitor





## 📄 Step 2 — Create Files to Monitor








```powershell



notepad firewall.txt



notepad policy.txt



notepad users.txt



```







```powershell

# firewall.txt



Firewall=Enabled



Ports=Closed

```







```powershell


# policy.txt



# policy.txt




PasswordPolicy=Strong



MFA=Enabled

```







```powershell

# users.txt



Admin=Enabled



Guest=Disabled

```




## 🔐 Step 3 — Create Multi-File FIM Script





## 🔐 Step 3 — Create Multi-File FIM Script
>>>>>>> 4bb28af (Added walkthroughs and added screenshots)







```powershell

notepad multi\\\_fim\\\_monitor.ps1

```




## ⚙️ Step 4 — Script Behavior





## ⚙️ Step 4 — Script Behavior








The script performs two main functions:







🟢 First Run (Baseline Mode)


-Calculates SHA256 hashes for all files

-Stores hashes in:



-Calculates SHA256 hashes for all files



-Stores hashes in:








```powershell

baseline\\\_hashes.csv

```







🔴 Second Run (Monitoring Mode)


-Compares current hashes to baseline

-Detects any file modifications

-Outputs alerts to console

-Logs alerts to:



-Compares current hashes to baseline



-Detects any file modifications



-Outputs alerts to console



-Logs alerts to:







```powershell

multi\\\_fim\\\_log.txt

```




## ▶️ Step 5 — Run the Script





## ▶️ Step 5 — Run the Script








```powershell

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass







.\\\\multi\\\_fim\\\_monitor.ps1

```



👉 First run creates the baseline



👉 Second run begins monitoring




## 🚨 Step 6 — Simulate Multi-File Attack





## 🚨 Step 6 — Simulate Multi-File Attack
>>>>>>> 4bb28af (Added walkthroughs and added screenshots)







Modify one or more files:







```powershell



notepad firewall.txt



```







Change:







```powershell



Ports=Closed



```







To:







```powershell



Ports=Open



```




##🧾 Step 8 — Logging Output




##🧾 Step 8 — Logging Output








Logs are written to:







```powershell



multi\\\_fim\\\_log.txt



```







Example log:







```powershell



2026-04-28 09:50:00 | ALERT | File modified: firewall.txt | Old Hash: ... | New Hash: ...



```




## 🧠 Skills Demonstrated (Day 2)

-Multi-file monitoring

-Directory-based integrity checks

-CSV baseline storage

-PowerShell automation

-Security logging across multiple assets

-Real-world SOC detection simulation





## 🧠 Skills Demonstrated (Day 2)



-Multi-file monitoring



-Directory-based integrity checks



-CSV baseline storage



-PowerShell automation



-Security logging across multiple assets



\-Real-world SOC detection simulation


