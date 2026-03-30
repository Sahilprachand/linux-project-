# Open Source Audit – Git

## Course Details
- Course Name: Open Source Software (OSS NGMC)
---

## Student Information
- Name: Sahil prachand
- Reg Number: 24MIP10025
- Slot: A24
- Submission Date: 30/03/26

---

## Chosen Software
- Software: Git
- Category: Version Control System
- License: GPL v2
- Created By: Linus Torvalds (2005)

---

## Project Description
This project is an audit of Git, a distributed version control system. It includes analysis of its origin, license, philosophy, Linux usage, ecosystem, and comparison with proprietary software.

---

## Scripts Description

### Script 1: System Identity Report
Displays system information such as kernel version, user, uptime, and date.

### Script 2: FOSS Package Inspector
Checks if Git is installed and shows package details.

### Script 3: Disk and Permission Auditor
Shows size, permissions, and ownership of system directories.

### Script 4: Log File Analyzer
Counts occurrences of a keyword in a log file.

### Script 5: Open Source Manifesto Generator
Takes user input and generates a manifesto saved in a file.

---

## How to Run

```bash
chmod +x script*.sh

bash script1_system_identity.sh
bash script2_package_inspector.sh
bash script3_disk_auditor.sh
bash script4_log_analyzer.sh /var/log/syslog error
bash script5_manifesto.sh
