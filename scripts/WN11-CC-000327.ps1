<#
.SYNOPSIS
    This PowerShell script Enabling PowerShell Transcription will record detailed information from the processing of PowerShell commands and scripts. This can provide additional detail when malware has run on a system.

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-25
    Last Modified   : 2026-07-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327
    Documentation   : https://stigaview.com/products/win11/v2r1/WN11-CC-000327/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS  "C:\Users\labuser\Desktop\STIG ID WN11-CC-000327.ps1"
#>


$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$valueName = "EnableTranscripting"
$valueData = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# Set the DWORD value (creates it if missing, updates it if present)
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Host "Set $valueName to $valueData at $regPath"
