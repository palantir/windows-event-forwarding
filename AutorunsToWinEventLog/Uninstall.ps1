# Remove the scheduled task
Unregister-ScheduledTask -TaskName "AutorunsToWinEventLog" -Confirm:$false

# Remove the Autoruns event log
Remove-EventLog -LogName "Autoruns"

# Remove AutorunsToWinEventLog folder
Remove-Item -Recurse -Force "c:\Program Files\AutorunsToWinEventLog"

