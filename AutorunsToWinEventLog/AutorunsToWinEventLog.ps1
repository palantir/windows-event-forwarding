# Authors: Chris Long (@Centurion), Eric (@vector_sec)
# This script executes the Sysinternals Autoruns CLI utility and saves the output to a CSV.
# Additionally, this script enumerates desktop shortcuts, BITS jobs, and browser extensions.
# The discovered entries from all tools are written to a Windows Event Log called "Autoruns"


## Code to create the custom Autoruns Windows event log if it doesn't exist
# The following event IDs are in use:
# 1 - Sysinternals Autoruns results
# 2 - BITS jobs
# 3 - Desktop shortcuts
# 4 - Browser extensions
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

# Get BITS Jobs, MITRE ATT&CK T1197
$bitsjobs = Get-BitsTransfer -AllUsers
# Get-BitsTransfer can't pull NotifyCmdLine information, so we have to use bitsadmin for that.
Foreach ($job in $bitsjobs) {
  $bitsoutput = "c:\Program Files\AutorunsToWinEventLog\BITSOutput.csv"
  $bitsproc = Start-Process -FilePath "c:\windows\system32\bitsadmin.exe" -ArgumentList "/RAWRETURN /GETNOTIFYCMDLINE {$($job.JobId)}"  -RedirectStandardOut $bitsoutput -WindowStyle hidden -Passthru
  $bitsproc.WaitForExit()
  $cmd = (Get-Content $bitsoutput).replace("the notification command line is ","")
  $job | Add-Member -MemberType NoteProperty -Name NotifyCmdLine -Value $cmd
  $job = ($job | Select-Object * -ExpandProperty FileList -ErrorAction SilentlyContinue | Out-String -Width 1000)
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 2 -Message $job
}

# Get LNK files from the desktop (SI Autoruns handles the LNK files in the startup directory), MITRE ATT&CK T1023
function Get-LnkFile {
    $obj = New-Object -ComObject WScript.Shell
    $desktop = "C:\Users\*\Desktop"
    $path = Get-ChildItem $desktop -Filter *.lnk -Recurse 
    $links = @()
    if ($path -is [string]) {
        $path = Get-ChildItem $path -Filter *.lnk
    }
    $path | ForEach-Object { 
        if ($_ -is [string]) {
            $_ = Get-ChildItem $_ -Filter *.lnk
        }
        if ($_) {
            $link = $obj.CreateShortcut($_.FullName)
            $link | Add-Member -MemberType NoteProperty -Name "CreationTimeUtc" -Value $_.CreationTimeUtc
            $links += $link
        }
    }
    return $links
}
$lnkfiles = Get-LnkFile
Foreach ($lnk in $lnkfiles) {
  $lnk = $(Write-Output $lnk  | Out-String -Width 1000).trim()
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 3 -Message $lnk
}

# Get browser extensions, MITRE ATT&CK T1176
# NOTE: Internet Explorer is handled by SI Autoruns

function Get-ChromeExtension {
    # Based on https://github.com/gangstanthony/PowerShell/blob/master/Get-ChromeExtension.ps1
    Get-ChildItem "C:\users\*\appdata\local\Google\Chrome\User Data\Default\Extensions\*\*\manifest.json" -ErrorAction SilentlyContinue | ForEach-Object {
        $_.FullName -match 'users\\(.*?)\\appdata' | Out-Null
        $id = ($_.FullName -split "\\") | Select-Object -Last 3 | Select-Object -First 1
        Get-Content $_.FullName -Raw | ConvertFrom-Json | select-Object @{n='Browser';e={'Chrome'}},@{n='User';e={$Matches[1]}},@{n='id';e={$id}}, name, version
    }
}
$chromeexts = Get-ChromeExtension | Where-Object name -notmatch '__msg_'
Foreach ($ext in $chromeexts) {
  $ext = $($ext | Format-List * | Out-String -Width 1000).trim()
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 4 -Message $ext
}

function Get-FirefoxAddon {
    Get-ChildItem "C:\Users\*\AppData\Roaming\Mozilla\Firefox\Profiles\*\addons.json" -ErrorAction SilentlyContinue | ForEach-Object {
        $_.FullName -match 'users\\(.*?)\\appdata' | Out-Null
        (Get-Content $_.FullName -Raw | ConvertFrom-Json).addons | Select-Object @{n='Browser';e={'FireFox'}},@{n='User';e={$Matches[1]}}, id, name, version, sourceURI
    }
}
$firefoxaddons = Get-FirefoxAddon
Foreach ($addon in $firefoxaddons) {
  $addon = $($addon | Format-List * | Out-String -Width 1000).trim()
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 4 -Message $addon
}

function Get-EdgeExtension {
    Get-ChildItem "C:\Program Files\WindowsApps\*\extension\manifest.json" -ErrorAction SilentlyContinue | ForEach-Object {
        Get-Content $_.FullName -Raw | ConvertFrom-Json | Select-Object @{n='Browser';e={'Edge'}},@{n='User';e={'Unknown'}}, name, version, author
    }
}
$edgeexts = Get-EdgeExtension
Foreach ($ext in $edgeexts) {
  $ext = $($ext | Format-List * | Out-String -Width 1000).trim()
  Write-EventLog -LogName Autoruns -Source AutorunsToWinEventLog -EntryType Information -EventId 4 -Message $ext
}
