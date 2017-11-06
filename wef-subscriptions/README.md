# WEF-Subscriptions

Windows Event Forwarding or WEF is a subscription-based methodology to push events of interest to a Windows Event Collector.  Subscriptions can be either source-initiated (push) or collector-initiated (pull).  Subscriptions rely on subscriber clients to have logging and WinRM turned on locally for the subscription request. In Palantir's environment with always-changing numbers of Windows systems, source-initiated subscriptions configured via GPO is the optimal model.

## List of WEF Subscriptions 
* **Account-Lockout**: Collects account lockout events. 
* **Account-Management**: Collects account management events (e.g., creation, deletion, group changes, etc.) 
* **Application-Crashes**: Collects application crash, hang, and error reporting events.
* **Applocker**: Collects applocker events for auditing, blocks, software restriction events, etc.
* **Authentication**: Collects successful, failed, explicit, and other logon events.
* **Autoruns**: Collects autorun events from Autoruns-to-WinEventLog.
* **Bits-Client**: Collects events related to the Background Information Transfer Service (BITS). 
* **Certificate-Authority**: Collects certificate authority events (e.g., requests, denies, issuance). 
* **Code-Integrity**: Collects events related to code integrity and device guard.
* **DNS**: Collects DNS queries and DNS Server DLL loading events.
* **Drivers**: Collects events related to user-mode driver loading, failed driver loading, or signing issues.
* **EMET**: Collects events related to the Enhanced Mitigation Experience Toolset (EMET). 
* **Event-Log-Diagnostics**: Collects events related to the Event Log service.
* **Explicit-Credentials**: Collects events that use explicit credentials. 
* **File-System**: Collects events related to file system auditing. 
* **Firewall**: Collects events related to the Windows Firewall.
* **Group-Policy-Errors**: Collects events related to group policy service errors. 
* **Kerberos**: Collects events related to Kerberos (e.g. ticket requests, failures, etc.) 
* **Log-Deletion-Security**: Collects log deletions involving the security event log.
* **Log-Deletion-System**: Collects log deletions involving the system event log.
* **MSI-Packages**: Collects events related to package installation, Windows Update, and software installation.
* **NTLM**: Collects events related to NTLM authentication and failures.
* **Operating-System**: Collects system events such as SMBv1, shutdowns, unexpected reboots, etc.
* **Powershell**: Collects PowerShell script block, module, operational, DSC, and other events.
* **Print**: Collects print service jobs and events.
* **Process-Execution**: Collects process execution and termination events. 
* **Registry**: Collects events related to registry auditing. 
* **Services**: Collects events related to service installation, failures, crashes, etc.
* **Shares**: Collects events related to network shares and mapped drives.
* **Smart-Card**: Collects events related to smart card authentication.
* **System-Time-Change**: Collects events related to system time changes.
* **Sysmon**: Collects events related to Sysinternals Sysmon.
* **Task-Scheduler**: Collects events related to the task scheduler and tasks. 
* **USB**: Collects events related to USB insertion, mass storage driver loading, and other USB activity. 
* **WMI**: Collects events from the WMI operational event logs.
* **Windows-Defender**: Collects Windows Defender detection and operational events.
* **Windows-Updates**: Collects Windows Update service and hotpatching errors.
* **Windows-Diagnostics**: Collects WEF diagnostic events. 
* **Wireless**: Collects wireless authentication events.


## Windows Event Collector Utility 101

Create a subscription or all the subscriptions
```
wecutil cs subscription.xml

C:\subscription-dir> for /r %i in (*.xml) do wecutil cs %i
```

Delete a subscription or all the subscriptions

WARNING: You're better off disabling the subscriptions first for server/eventvwr stability.
```
wecutil ds subscriptionid

C:\subscription-dir> for /r %i in (*.xml) do wecutil ds %~ni
```

See XML details and subscribers
```
wecutil gs subscriptionid
```
