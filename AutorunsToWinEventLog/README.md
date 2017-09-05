# Autoruns to WinEventLog

## What is Autoruns?

Autoruns is a tool developed by Sysinternals that allows you to view all of the
locations in Windows where applications can insert themselves to launch at boot
or when certain applications are opened. Malware often takes advantages of these
locations to ensure that it runs whenever your computer boots up.

More on Autoruns here: https://technet.microsoft.com/en-us/sysinternals/bb963902.aspx

## Installation Instructions
From an Admin Powershell console run `.\Install.ps1`. This script does the following:
* Creates the directory structure at c:\Program Files\AutorunsToWinEventLog
* Copies over AutorunsToWinEventLog.ps1 to that directory
* Downloads Autorunsc64.exe from https://live.sysinternals.com
* Sets up a scheduled task to run the script daily @ 11am

If you'd like to run it immediately, open up the scheduled tasks library and launch it from there.

## What does AutorunsToWinEventLog do?

Autoruns conveniently includes a non-interactive command line utility. This code
generates a CSV of Autoruns entries, converts them to JSON, and finally inserts
them into a custom Windows Event Log. By doing this, we can take advantage of
our existing WEF infrastructure to get these entries into our SIEM and start
looking for signs of malicious persistence on endpoints and servers.
