# Authors: Chris Long (@Centurion), Andy Robbins (@_wald0)
# This script executes the Sysinternals Autoruns CLI utility and saves the output to a CSV.
# The resulting CSV entries are written to a Windows Event Log called "Autoruns"

## Code to create the custom Autoruns Windows event log if it doesn't exist
# The following event IDs are in use:
# 1 - Sysinternals Autoruns results
# 2 - Local Group Principals
$logfileExists = Get-Eventlog -list | Where-Object {$_.logdisplayname -eq "Autoruns"}
if (! $logfileExists) {
  New-EventLog -LogName Autoruns -Source AutorunsToWinEventLog
}

# Define the path where the Autoruns CSV will be saved
$autorunsCsv = "c:\Program Files\AutorunsToWinEventLog\AutorunsOutput.csv"

## Autorunsc64.exe flags:
# -nobanner    Don't output the banner (breaks CSV parsing)
# /accepteula  Automatically accept the EULA
# -a *         Record all entries
# -c           Output as CSV
# -h           Show file hashes
# -s           Verify digital signatures
# -v           Query file hashes againt Virustotal (no uploading)
# -vt          Accept Virustotal Terms of Service
#  *           Scan all user profiles

## Normally we'd add a "-Wait" flag to this Start-Process, but it seems to be
## broken when called from RunAs or Scheduled Tasks: https://goo.gl/8NcvcK
$proc = Start-Process -FilePath "c:\Program Files\AutorunsToWinEventLog\Autorunsc64.exe" -ArgumentList '-nobanner', '/accepteula', '-a *', '-c', '-h', '-s', '-v', '-vt', '*'  -RedirectStandardOut $autorunsCsv -WindowStyle hidden -Passthru
$proc.WaitForExit()
$autorunsArray = Import-Csv $autorunsCsv

Foreach ($item in $autorunsArray) {
  $item = $(Write-Output $item  | Out-String -Width 1000)
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 1 -Message $item
}

# Collect principals in interesting local groups (Administrators, Remote Desktop Users, and DCOM Users)
# Requires PowerShell 5.1 due to usage of Get-NetLocalGroup and Get-LocalGroupMember

# Get the FQDN of the current computer's domain. Todo: update this method to support foreign security principals in local groups.
$ComputerName = (Get-WmiObject win32_computersystem).DNSHostName + "." + (Get-WmiObject -class win32_computersystem).Domain
$DomainFQDN = $ComputerName.Split(".")[1..($ComputerName.Split(".").length-1)] -Join "."

$LocalGroups = Get-LocalGroup | ?{$_.SID -Match "S-1-5-32-555" -Or $_.SID -Match "S-1-5-32-544" -Or $_.SID -Match
 "S-1-5-32-562"}

$LocalGroups | % {

    $GroupName = $_

    Get-LocalGroupMember -Name $GroupName | ?{
        $_.PrincipalSource -Match "ActiveDirectory"
    } | % {

        $principalName = $_.Name.Split("\")[1] + "@" + $DomainFQDN

        $Member = New-Object PSObject
        $Member | Add-Member Noteproperty 'GroupName' $GroupName
        $Member | Add-Member Noteproperty 'PrincipalType' $_.ObjectClass
        $Member | Add-Member Noteproperty 'PrincipalName' $principalname

        $Data = @"

GroupName: $($Member.GroupName)
PrincipalType: $($Member.PrincipalType)
PrincipalName: $($Member.PrincipalName)
"@

        Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 2 -Message $Data

    }
}
