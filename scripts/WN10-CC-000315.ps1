<#
.SYNOPSIS
    This PowerShell script Prevents non-admin users from installing MSI packages with elevated privileges, closing a privilege-escalation path and bringing the system into compliance with the STIG..

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-26
    Last Modified   : 2026-07-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000315
    Documentation   : https://stigaview.com/products/win10/v3r4/WN10-CC-000315/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS "C:\Users\labuser\Desktop\STIG ID WN11-CC-000315.ps1"
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$valueName = "AlwaysInstallElevated"
$valueData = 0

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# Set the DWORD value (creates it if missing, updates it if present)
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Host "Set $valueName to $valueData at $regPath"
