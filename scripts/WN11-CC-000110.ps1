<#
.SYNOPSIS
    This PowerShell script Disables printing over HTTP, bringing the system into compliance with STIG WN11-CC-000110..

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-25
    Last Modified   : 2026-07-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110
    Documentation   : https://stigaview.com/products/win11/v2r2/WN11-CC-000110/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\Users\labuser\Desktop\2 stigs in one.ps1
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$valueName = "DisableHTTPPrinting"
$valueData = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# Set the DWORD value (creates it if missing, updates it if present)
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Host "Set $valueName to $valueData at $regPath (WN11-CC-000110 - Printing over HTTP disabled)"
