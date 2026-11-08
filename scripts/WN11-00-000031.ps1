<#
.SYNOPSIS
    This PowerShell script Enforces a BitLocker PIN for pre-boot authentication, bringing the system into compliance with STIG WN11-00-000031.

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-25
    Last Modified   : 2026-07-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000031
    Documentation   : https://stigaview.com/products/win11/v1r6/WN11-00-000031/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\Users\labuser\Desktop\STIG ID WN11-00-000031.ps1
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Ensure the key path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# --- Base setting: Enable "Require additional authentication at startup" ---
New-ItemProperty -Path $regPath -Name "UseAdvancedStartup" -Value 1 -PropertyType DWord -Force | Out-Null

# Require TPM to be present (don't allow BitLocker without TPM)
New-ItemProperty -Path $regPath -Name "EnableBDEWithNoTPM" -Value 0 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $regPath -Name "UseTPM" -Value 2 -PropertyType DWord -Force | Out-Null   # 2 = Require TPM

# --- Choose ONE of the two blocks below based on whether Network Unlock is active ---

# If Network Unlock is NOT active (most common case):
# Require startup key AND PIN with TPM
New-ItemProperty -Path $regPath -Name "UseTPMKeyPIN" -Value 2 -PropertyType DWord -Force | Out-Null   # 2 = Require

# If Network Unlock IS active, comment out the UseTPMKeyPIN line above and use this instead:
# Require startup PIN with TPM
# New-ItemProperty -Path $regPath -Name "UseTPMPIN" -Value 2 -PropertyType DWord -Force | Out-Null    # 2 = Require

Write-Host "BitLocker 'Require additional authentication at startup' policy configured."
