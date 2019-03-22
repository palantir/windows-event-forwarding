# WEC-Registry-Tweaks

In high volume environments, it may be necessary to increase memory buffers for heavy intake Subscriptions. 
Applying these registry files will increase the buffers available for the Windows event collector, but has the possibility of exhausting system resources.
Once rebooted, you can look at the [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\[Event-Channel]\{[Provider-Guid]}\Status] entry to determine if the resources were allocated successfully (0) or if the system doesn't have enough resources (1450)

## Contents of Registry Files

```
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\[Event-Channel]]
"Guid"="{[Unique-Guid]}"
"BufferSize"=dword:00000100
"FlushTimer"=dword:00000000
"MaximumBuffers"=dword:00000400
"MinimumBuffers"=dword:00000000
"OwningChannel"="[Event-Channel]"
"Start"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\[Event-Channel]\{[Provider-Guid]}]
"Enabled"=dword:00000001
```

### Descriptions

* Guid - Unique Per Subscription
REG_SZ
A string that contains a GUID that uniquely identifies the session. This value is required.
* BufferSize - Default to 256 (256KB)
REG_DWORD
The size of each buffer, in kilobytes. Should be less than one megabyte. ETW uses the size of physical memory to calculate this value.
* FlushTimer - Default to 0
REG_DWORD
How often, in seconds, the trace buffers are forcibly flushed. The minimum flush time is 1 second. This forced flush is in addition to the automatic flush that occurs when a buffer is full and when the trace session stops. For the case of a real-time logger, a value of zero (the default value) means that the flush time will be set to 1 second. A real-time logger is when LogFileMode is set to EVENT_TRACE_REAL_TIME_MODE.The default value is 0. By default, buffers are flushed only when they are full. 
* MaximumBuffers - Default to 1024 buffers (Defaults to 256MB Maximum per buffer)
REG_DWORD
The maximum number of buffers to allocate. Typically, this value is the minimum number of buffers plus twenty. ETW uses the buffer size and the size of physical memory to calculate this value. This value must be greater than or equal to the value for MinimumBuffers.
* MinimumBuffers
REG_DWORD
The minimum number of buffers to allocate at startup. The minimum number of buffers that you can specify is two buffers per processor. For example, on a single processor computer, the minimum number of buffers is two.
* Start
REG_DWORD
To have the AutoLogger session start the next time the computer is restarted, set this value to 1; otherwise, set this value to 0.



## Helpful Resources
* [Microsoft WMI Autologger documentation](https://docs.microsoft.com/en-us/windows/desktop/etw/configuring-and-starting-an-autologger-session)
* [Windows Event Forwarding into HP/ArchSight at Scale](https://community.softwaregrp.com/dcvta86296/attachments/dcvta86296/arcsight-discussions/24729/1/Protect2015-WindowsEventForwarding.pdf)
