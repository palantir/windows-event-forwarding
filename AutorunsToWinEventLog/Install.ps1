# Create Program Files directories
$autorunsDir = "C:\Program Files\AutorunsToWinEventLog"
If(!(test-path $autorunsDir)) {
  New-Item -ItemType Directory -Force -Path $autorunsDir
}

# Download Autorunsc64.exe if it doesn't exist
$autorunsPath = "c:\Program Files\AutorunsToWinEventLog\Autorunsc64.exe"
if(!(test-path $autorunsPath)) {
  # Requires TLS 1.2
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-WebRequest -Uri "https://live.sysinternals.com/autorunsc64.exe" -OutFile "$autorunsPath"
}

# Put a copy of the AutorunsToWinEventLog script in the Autoruns directory
copy "$PSScriptRoot\AutorunsToWinEventLog.ps1" "$autorunsDir\AutorunsToWinEventLog.ps1"

$ST_A = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle hidden c:\PROGRA~1\AutorunsToWinEventLog\AutorunsToWinEventLog.ps1"
$ST_T = New-ScheduledTaskTrigger -Daily -At 11am
$ST_P = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -RunLevel Highest -LogonType ServiceAccount
Register-ScheduledTask -TaskName "AutorunsToWinEventLog" -Action $ST_A -Trigger $ST_T -Principal $ST_P

$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -Hidden -ExecutionTimeLimit (New-TimeSpan -Minutes 60) -RestartCount 1 -StartWhenAvailable
Set-ScheduledTask -TaskName "AutorunsToWinEventLog" -Settings $settings
