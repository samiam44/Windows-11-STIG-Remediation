<#
.SYNOPSIS
Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. 
Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. 
Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior. 
Credential validation records events related to validation tests on credentials for a user account logon.

.NOTES
    Author          : John Samudio
    LinkedIn        : www.linkedin.com/in/johnsamudio
    GitHub          : https://github.com/samiam44
    Date Created    : 2026-07-26
    Last Modified   : 2026-07-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000582
    Documentation   : https://stigaview.com/products/win11/v2r5/WN11-AU-000582/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS "C:\Users\labuser\Desktop\STIG ID WN11-AU-000582.ps1"
#>


# Enable "Audit File System" success auditing (STIG: audit file system successes)
auditpol /set /subcategory:"File System" /success:enable

# Verify the setting
Write-Host "Current 'File System' audit subcategory setting:"
auditpol /get /subcategory:"File System"
