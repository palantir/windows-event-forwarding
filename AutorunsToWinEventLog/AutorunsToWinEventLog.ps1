# Author: Chris Long (@Centurion)
# This script executes the Sysinternals Autoruns CLI utility and saves the output to a CSV.
# The resulting CSV entries are written to a Windows Event Log called "Autoruns"

## Code to create the custom Autoruns Windows event log if it doesn't exist
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
# -m           Hide Microsoft signed entries
# -s           Verify digital signatures
# -v           Query file hashes againt Virustotal (no uploading)
# -vt          Accept Virustotal Terms of Service
#  *           Scan all user profiles

## Normally we'd add a "-Wait" flag to this Start-Process, but it seems to be
## broken when called from RunAs or Scheduled Tasks: https://goo.gl/8NcvcK
$proc = Start-Process -FilePath "c:\Program Files\AutorunsToWinEventLog\Autorunsc64.exe" -ArgumentList '-nobanner', '/accepteula', '-a *', '-c', '-h', '-m', '-s', '-v', '-vt', '*'  -RedirectStandardOut $autorunsCsv -WindowStyle hidden -Passthru
$proc.WaitForExit()
$autorunsArray = Import-Csv $autorunsCsv

Foreach ($item in $autorunsArray) {
  $item = $(Write-Output $item  | Out-String)
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 1 -Message $item
}
