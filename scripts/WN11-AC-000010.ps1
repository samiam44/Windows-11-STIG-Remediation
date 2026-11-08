<#
.SYNOPSIS
   The account lockout feature, when enabled, prevents brute-force password attacks on the system. The higher this value is, the less effective the account lockout feature will be in protecting the local system.

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-26
    Last Modified   : 2026-07-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010
    Documentation   : https://stigaview.com/products/win11/v2r1/WN11-AC-000010/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS "C:\Users\labuser\Desktop\STIG ID WN11-AC-000010.ps1"
#>


# Set Account Lockout Threshold to 3 invalid attempts (STIG requires <=3 and >0)
net accounts /lockoutthreshold:3

# Verify the setting
Write-Host "Current account lockout policy:"
net accounts
