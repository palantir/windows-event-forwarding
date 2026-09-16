# Windows Event Channels
As described in the blog post [Creating Custom Windows Event Forwarding Logs](https://blogs.technet.microsoft.com/russellt/2016/05/18/creating-custom-windows-event-forwarding-logs/), WEF can be extended with additional custom event channels. Extending the number of event channels available provides a few primary benefits:

* Each event channel can have an independent maximum size and rotation strategy.
* Each event channel can be used as a unique identifier for tagging data for ingestion into a SIEM.
* Event channels may be placed on different disks or storage devices for improving disk I/O.

The Event Channel manifest provided in this project defines **16 providers and 46 channels**. Channels follow a standard naming scheme of `WEC[#]-Name`, where the number identifies the provider that owns the channel.

Not every provider is fully populated. Providers `WEC` through `WEC6` each define the maximum of 7 channels, `WEC7` defines 3, `WEC8` through `WEC15` are **intentionally empty**, and `WEC16` holds a single placeholder channel. The empty providers are pre-registered headroom: each one already has a unique GUID, so you can add your own channels to them without generating GUIDs or restructuring the manifest. See [Customizing the manifest](#customizing-the-manifest) below.

### Provider and channel layout

Each provider imports the `System` channel, which consumes one of its 8 available channel slots. That is why no provider may define more than 7 channels of its own.

| Provider | GUID | Channels defined | Free slots |
| --- | --- | ---: | ---: |
| `WEC` | `{17A89D9F-61D2-4066-9085-B974FDD1EA00}` | 7 | 0 |
| `WEC2` | `{C743AE12-C221-452C-A48C-FEF1EE6882C0}` | 7 | 0 |
| `WEC3` | `{1E66E2D0-4835-4CC9-AA1D-FE12F0F4B509}` | 7 | 0 |
| `WEC4` | `{B16A2012-947A-424A-987C-B89D6D364FAA}` | 7 | 0 |
| `WEC5` | `{87D435A6-ED4F-45BC-B602-A0D882F2D60C}` | 7 | 0 |
| `WEC6` | `{2AA88F33-BB49-4AF4-B502-FAF88523361E}` | 7 | 0 |
| `WEC7` | `{0593175A-3838-4F4E-ABF2-BB9DD7E1D4B2}` | 3 | 4 |
| `WEC8` | `{37E559A5-3E9D-44CE-B8F8-43031416238D}` | 0 | 7 |
| `WEC9` | `{E98B5624-2666-4110-BB76-3FC6F0101C59}` | 0 | 7 |
| `WEC10` | `{77BD886F-C107-4331-9DB8-B32A1D0B67ED}` | 0 | 7 |
| `WEC11` | `{16198C10-2A57-4843-A710-1D4E00B871A3}` | 0 | 7 |
| `WEC12` | `{A0FBA27D-117C-4E09-A199-B28718E898D2}` | 0 | 7 |
| `WEC13` | `{6844DF0C-9F46-4293-960A-4D7DDB2FDFF3}` | 0 | 7 |
| `WEC14` | `{0A648014-75BD-4CE4-9258-ACCE11ABB985}` | 0 | 7 |
| `WEC15` | `{27156411-2F96-486C-83A4-A43958654C70}` | 0 | 7 |
| `WEC16` | `{27265CB0-6637-40B4-8842-E25210D38660}` | 1 | 6 |
| **Total** | | **46** | **66** |

The shipped `CustomEventChannels.dll` already contains all 16 providers. If you only add channels to existing providers you still have to recompile and redeploy the DLL, because the channel definitions live inside it.

Once the Event Channel manifest has been compiled into a DLL, it is loaded onto the WEC server, where it will register and create the appropriate channels and log files.

If you're like us and don't trust random DLLs, feel free to use our manifest file and build your own.

## List of WEF channels
This list mirrors the channels defined in `CustomEventChannels.man`. Run `validate-event-channels.py` (see [Validating your changes](#validating-your-changes)) to confirm the two stay in sync.

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
* **WEC4-Windows-Updates**: Event channel for collecting windows update events.
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
* **WEC16-Test**: Placeholder channel used to verify that a newly compiled manifest loads correctly. It is not referenced by any subscription in `wef-subscriptions/`; you can remove it or repurpose it.

Providers `WEC8` through `WEC15` define no channels. They are reserved for your own additions.

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

## Customizing the manifest

Most deployments need channels this project does not ship. The manifest is laid out so you can add them without restructuring anything: pick a provider that still has free slots (see [Provider and channel layout](#provider-and-channel-layout)) and add channels to it.

### Adding a channel

1. **Choose a provider with a free slot.** `WEC8` through `WEC15` are empty and exist for exactly this purpose. `WEC7` has 4 slots left and `WEC16` has 6. Do not add an unlisted 8th channel to a full provider.
2. **Add a `<channel>` element** inside that provider's `<channels>` block. To add a channel for Windows Remote Management events to `WEC8`:

   ```xml
   <channel name="WEC8-WinRM" chid="WEC8-WinRM" symbol="WEC8_WinRM" type="Operational" enabled="true"></channel>
   ```

   - `name` and `chid` use hyphens and must match the `WEC#-Name` scheme, where `#` is the owning provider.
   - `symbol` is the same string with **underscores instead of hyphens**. It becomes a C# identifier during compilation, so a hyphen there breaks the build.
   - `name`, `chid` and `symbol` must each be unique across the entire manifest, not just within the provider.
   - Keep `type="Operational"` and `enabled="true"`. Analytic and Debug channels behave differently and are not suitable for forwarded events.
3. **Leave the existing provider GUIDs alone.** They are baked into the compiled DLL and into the channel registration on every WEC server you have already deployed to. Changing a GUID orphans the channels that were registered under the old one. Only generate a new GUID if you are adding a brand new 17th provider.
4. **Add the channel to the [List of WEF channels](#list-of-wef-channels)** in this README so the documentation stays accurate.
5. **Recompile and redeploy** the DLL, following [Compiling](#compiling) and [Deployment](#deployment). Channel definitions live inside the DLL, so editing the `.man` file alone changes nothing on the collector.
6. **Point a subscription at it.** A channel receives nothing until a subscription writes to it. Set the `<LogFile>` element of the relevant file in [`wef-subscriptions/`](../wef-subscriptions) to your new channel name.

### Things to watch out for

- **Renaming a channel creates a new log.** The old `.evtx` file is left behind under `%SystemRoot%\System32\winevt\Logs` and stops receiving events. Treat a rename as a new channel plus a retired one, and update every subscription that referenced the old name.
- **Unloading the manifest unregisters its channels.** `wevtutil um` is part of the documented redeployment path, but events that have not been forwarded on to a SIEM should be preserved before you run it.
- **Plan for disk.** The deployment step below sizes every channel at 4 MiB (`/ms:4194304`). The 46 shipped channels are roughly 184 MiB; a busy channel such as Sysmon or Process-Execution usually wants considerably more. Size channels individually rather than applying one value to all of them if your volumes vary.
- **A subscription pointing at a channel that does not exist fails silently.** The subscription will show as active while collecting nothing, which is why the validation script below cross-checks the two.

### Validating your changes

`validate-event-channels.py` checks the manifest against this README and against the subscriptions in `wef-subscriptions/`. It needs Python 3 and nothing else, and it runs on any platform:

```
python3 validate-event-channels.py
```

It reports:

- malformed XML in the manifest or in any subscription file
- providers exceeding the 7-channel limit
- duplicate channel names, `chid` values or symbols
- symbols containing hyphens, or not matching their channel name
- channels missing from the README list, or listed in the README but absent from the manifest
- subscriptions whose `<LogFile>` names a channel the manifest does not define

Run it after editing the manifest and before compiling the DLL. It exits non-zero when it finds a problem.

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
