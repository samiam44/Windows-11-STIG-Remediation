<#
.SYNOPSIS
    This PowerShell script Enforces a minimum BitLocker startup PIN length of 6 characters, bringing the system into compliance with this STIG.

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-26
    Last Modified   : 2026-07-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000032
    Documentation   : https://stigaview.com/products/win11/v2r2/WN11-00-000032/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS "C:\Users\labuser\Desktop\STIG ID WN11-00-000032.ps1"
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$valueName = "MinimumPIN"
$valueData = 6

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# Set the DWORD value (creates it if missing, updates it if present)
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Host "Set $valueName to $valueData at $regPath"
