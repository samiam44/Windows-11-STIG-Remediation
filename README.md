# Windows 11 STIG Remediation

PowerShell scripts that bring Windows 11 into compliance with DISA Security Technical Implementation Guide (STIG) controls. Each script fixes one finding, is idempotent (safe to run more than once), and documents its STIG ID and reference in the header.

**Author:** John Samudio · [LinkedIn](https://www.linkedin.com/in/johnsamudio/)

## Scripts

| STIG ID | Area | What the script does |
| --- | --- | --- |
| [WN11-00-000031](scripts/WN11-00-000031.ps1) | BitLocker | Requires a BitLocker PIN for pre-boot authentication |
| [WN11-00-000032](scripts/WN11-00-000032.ps1) | BitLocker | Enforces a minimum BitLocker startup PIN length of 6 |
| [WN11-AC-000010](scripts/WN11-AC-000010.ps1) | Account policy | Sets the account lockout threshold to 3 invalid attempts to slow brute-force attacks |
| [WN11-AU-000500](scripts/WN11-AU-000500.ps1) | Audit and logging | Sets the Application event log maximum size to at least 32 MB |
| [WN11-AU-000582](scripts/WN11-AU-000582.ps1) | Audit and logging | Enables success auditing for the File System subcategory |
| [WN11-CC-000110](scripts/WN11-CC-000110.ps1) | Attack surface | Disables printing over HTTP |
| [WN11-CC-000197](scripts/WN11-CC-000197.ps1) | Attack surface | Turns off Microsoft consumer experiences (unwanted app installs) |
| [WN11-CC-000327](scripts/WN11-CC-000327.ps1) | Audit and logging | Enables PowerShell transcription to record executed commands |
| [WN11-SO-000275](scripts/WN11-SO-000275.ps1) | User Account Control | Virtualizes file and registry writes for non-UAC-compliant apps |
| [WN10-CC-000315](scripts/WN10-CC-000315.ps1) | Privilege escalation | Blocks non-admin users from installing MSI packages with elevated privileges |

## How to use

1. Open PowerShell **as Administrator** on the target machine.
2. Review the script, then run it, for example:
   ```powershell
   .\scripts\WN11-CC-000110.ps1
   ```
3. Re-scan (for example with Tenable/Nessus or DISA STIG Viewer) to confirm the finding is closed.

Test in a lab or non-production system first. Each script header links to the control's documentation on [stigaview.com](https://stigaview.com).

## Skills shown

Windows 11 hardening · DISA STIG compliance · PowerShell scripting · Registry and Group Policy settings · Audit policy · BitLocker
