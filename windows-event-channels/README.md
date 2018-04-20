# Windows Event Channels
As described in the blog post [Creating Custom Windows Event Forwarding Logs](https://blogs.technet.microsoft.com/russellt/2016/05/18/creating-custom-windows-event-forwarding-logs/), WEF can be extended with additional custom event channels. Extending the number of event channels available provides a few primary benefits:

* Each event channel can have an independent maximum size and rotation strategy.
* Each event channel can be used as a unique identifier for tagging data for ingestion into a SIEM.
* Event channels may be placed on different disks or storage devices for improving disk I/O.

The Event Channel manifest provided in this project consists of 16 individual providers, each with 7 channels. Channels follow a standard naming scheme of WEC[#], where the number is related to the provider.

Once the Event Channel manifest has been compiled into a DLL, it is loaded onto the WEC server, where it will register and create the appropriate channels and log files.

If you're like us and don't trust random DLLs, feel free to use our manifest file and build your own.

## List of WEF channels
* **WEC-Powershell**: Event channel for collecting PowerShell events.
* **WEC-WMI:** Event channel for collecting WMI events.
* **WEC-EMET**: Event channel for collecting EMET events.
* **WEC-Authentication**: Event channel for collecting authentication events.
* **WEC-Services**: Event channel for collecting services events.
* **WEC-Process-Execution**: Event channel for collecting process creation/termination events.
* **WEC-Code-Integrity**: Event channel for collecting device guard and code integrity events.
* **WEC2-Registry**: Event channel for collecting registry audit events.
* **WEC2-Object-Manipulation**: Event channel for collecting object audit events.
* **WEC2-Applocker**: Event channel for collecting applocker events.
* **WEC2-Task-Scheduler**: Event channel for collecting scheduled task and at events.
* **WEC2-Application-Crashes**: Event channel for collecting application crash events.
* **WEC2-Windows-Defender**: Event channel for collecting windows defender events.
* **WEC2-Group-Policy-Errors**: Event channel for collecting group policy error events.
* **WEC3-Drivers**: Event channel for collecting driver events.
* **WEC3-Account-Management**: Event channel for collecting account management events.
* **WEC3-Windows-Diagnostics**: Event channel for collecting diagnostic events.
* **WEC3-Smart-Card**: Event channel for collecting smart card events.
* **WEC3-External-Devices**: Event channel for collecting USB and external device events.
* **WEC3-Print**: Event channel for collecting printer and print job events.
* **WEC3-Firewall**: Event channel for collecting firewall events.
* **WEC4-Wireless**: Event channel for collecting 802.1 wireless events.
* **WEC4-Shares**: Event channel for collecting SMB share events.
* **WEC4-Bits-Client**: Event channel for collecting BITS Client events.
* **WEC4-Windows-Update**: Event channel for collecting windows update events.
* **WEC4-Hotpatching-Errors**: Event channel for collecting hotpatching error events.
* **WEC4-DNS**: Event channel for collecting DNS query and DLL loading events.
* **WEC4-System-Time-Change**: Event channel for collecting time change events.
* **WEC5-Operating-System**: Event channel for collecting operating system events.
* **WEC5-Certificate-Authority**: Event channel for collecting CA events.
* **WEC5-Crypto-API**: Event channel for collecting crypto API events.
* **WEC5-MSI-Packages**: Event channel for collecting package installation events.
* **WEC5-Log-Deletion-Security**: Event channel for collecting log deletion events.
* **WEC5-Log-Deletion-System**: Event channel for collecting log deletion events.
* **WEC5-Autoruns**: Event channel for collecting Autoruns-To-Wineventlog events.
* **WEC6-Exploit-Guard**: Event channel for collecting Exploit Guard events.
* **WEC6-Duo-Security**: Event channel for collecting Duo Security events.
* **WEC6-Device-Guard**: Event channel for collecting Device Guard events.
* **WEC6-ADFS**: Event channel for collecting Active Directory Federation Services events.
* **WEC6-Sysmon**: Event channel for collecting Sysinternals Sysmon events.
* **WEC6-Software-Restriction-Policies**: Event channel for collecting Software Restriction Policy events.
* **WEC6-Microsoft-Office**: Event channel for collecting Microsoft Office events.
* **WEC7-Active-Directory**: Event channel for collecting Active Directory change events.
* **WEC7-Terminal-Services**: Event channel for collecting Terminal Services and Terminal Services Gateway events.
* **WEC7-Privilege-Use**: Event channel for collecting privilege events.

## Pre-Requisites:
You will need the following software to build the DLL:
- Windows 10 SDK (Note that ecmangen.exe has been removed from the SDK as at version 10.0.16299.15)

>From [Microsoft](https://developer.microsoft.com/en-US/windows/downloads/windows-10-sdk): "Developers who rely on ecmangen for event manifest creation are advised to install the [Windows Creators Edition of the SDK](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive) to obtain the file"
- Windows Workstation

## Editing:
Launch the Manifest Generator
```
“C:\Program Files (x86)\Windows Kits\10\bin\x64\ecmangen.exe”
```
Load the CustomEventChannels.man file from this repo.

Make any changes to the file. Ensure the following settings are observed:
- All channels are marked as Operational and Enabled.
- No more than 7 channels are added to each provider.
- Channels following the naming scheme (WEC#-Name)
- Symbols use underscores and not hyphens.

## Compiling:
To compile, perform the following from a cmd.exe shell:
```
"C:\Program Files (x86)\Windows Kits\10\bin\x64\mc.exe" CustomEventChannels.man
"C:\Program Files (x86)\Windows Kits\10\bin\x64\mc.exe" -css CustomEventChannels.DummyEvent CustomEventChannels.man
"C:\Program Files (x86)\Windows Kits\10\bin\x64\rc.exe" CustomEventChannels.rc
"C:\Windows\Microsoft.NET\Framework64\v4.x.x\csc.exe" /win32res:CustomEventChannels.res /unsafe /target:library /out:CustomEventChannels.dll C:CustomEventChannels.cs
```

## Deployment:

For each WEF server you need to deploy this to, perform the following:

1) Disable the Windows Event Collector Service:

```
net stop Wecsvc
```

2) Disable all current WEF subscriptions.


3) Unload the current Event Channel file:
```
wevtutil um C:\windows\system32\CustomEventChannels.man
```

4) Copy (and replace) the following files to each WEF server under C:\Windows\system32:
```
CustomEventChannels.dll
CustomEventChannels.man
```

5) Load the new Event Channel file:
```
wevtutil im C:\windows\system32\CustomEventChannels.man
```

6) Resize the log files:
```
$xml = wevtutil el | select-string -pattern "WEC"
    foreach ($subscription in $xml) {
      wevtutil sl $subscription /ms:4194304
    }
```

7) Re-enable the WEF subscriptions.

8) Re-enable the Windows Event Collector service
