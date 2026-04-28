\# 🛡️ File Integrity Monitoring Lab Walkthrough



\## 📌 Overview



This document provides step-by-step instructions for building a PowerShell-based File Integrity Monitoring lab.



The lab demonstrates how hashing can be used to detect unauthorized file changes, simulate attacker activity, and generate SOC-style alerts.



\---



\# 🟢 Day 1 — Basic Hashing and Single-File Monitoring



\## 🎯 Goal



Create a basic File Integrity Monitoring script that monitors one critical file and detects changes using SHA256 hashing.



\---



\## 🧱 Step 1 — Create the Project Folder



```powershell

cd $HOME\\Documents

mkdir HashLab

cd HashLab



\## Step 2 — Create a Critical Configuration File



notepad system\_config.txt



Example file contents:



\# System Configuration File

Firewall=Enabled

Antivirus=Enabled

AutoUpdates=Enabled

RemoteAccess=Disabled



\## Step 3 — Generate a Baseline Hash



Get-FileHash .\\system\_config.txt -Algorithm SHA256



\## Step 4 — Create the FIM Script



notepad fim\_monitor.ps1



\## Step 5 — Run the Script



Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass



.\\fim\_monitor.ps1



\## Step 6 — Simulate File Tampering



Modify system\_config.txt:



RemoteAccess=Enabled



\## Step 7 — Add Logging



The script was upgraded to write alerts to:



fim\_log.txt



Example log format: 2026-04-28 09:27:00 | ALERT | File modified: system\_config.txt | Old Hash: ... | New Hash: ...



