\# 🛡️ File Integrity Monitoring (FIM) Lab



\## 📌 Overview

This project simulates a real-world File Integrity Monitoring (FIM) solution using PowerShell. It demonstrates how SOC analysts detect unauthorized file modifications using SHA256 hashing.



\## 🧪 Features

\- Baseline hash generation  

\- Continuous file integrity monitoring  

\- Real-time detection of unauthorized changes  

\- Simulated attacker behavior  



\## 🛠️ Technologies

\- PowerShell

\- SHA256 Hashing

\- Windows File System



\## 🚨 Scenario

A critical system configuration file is monitored. When the file is modified (simulating an attacker), the script detects the change and generates an alert.



\## ▶️ Usage

```powershell

.\\fim\_monitor.ps1

```



## 📸 Step-by-Step Demo

### 1️⃣ Creating the Lab Directory
![Step 1](screenshots/1.%20Making%20HashLab%20Directory.jpg)

### 2️⃣ Generating Baseline Hash
![Step 2](screenshots/2.%20Getting%20Baseline%20Hash.jpg)

### 3️⃣ Simulating Configuration Change
![Step 3](screenshots/3.%20Updated%20from%20Disabled%20to%20Enabled.jpg)

### 4️⃣ Detecting Hash Change
![Step 4](screenshots/4.%20Updated%20Hash.jpg)

### 5️⃣ Creating the FIM Script
![Step 5](screenshots/5.%20Creating%20File%20Integrity%20Monitoring%20Script.jpg)

### 6️⃣ Running the Monitoring Script
![Step 6](screenshots/6.%20Running%20FIM%20Script.jpg)

### 7️⃣ Simulated Attack Detection
![Step 7](screenshots/7.%20Simulated%20Attack.jpg)
