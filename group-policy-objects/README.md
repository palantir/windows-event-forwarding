# Group Policy Objects

The following are group policy object (GPO) recommendations for an optimal WEF setup. Recommendations should be taken as advice, and should be custom-tailored for your own organization and risk tolerance.

Domain Controller Enhanced Auditing Policy
-----

**Description**: This policy enables the high-security auditing recommendations by Microsoft. This is applied to all domain controllers and will configure the following settings:

* Audit categories for event logs.
* Appropriate Event Log Readers group membership for WEF.
* Command line auditing for process creation events.
* Secure Windows Remote Management (WinRM) defaults.
* Event log retention and size.

**Where to Link**: Domain Controllers OU.

**Caveats**: Tweak auditing policies according to your own risk tolerance.

**Configuration**:

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options** to the following:

* **Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings**: Enabled
* **Network security: Restrict NTLM: Audit Incoming NTLM Traffic**: Enable auditing for all accounts
* **Network security: Restrict NTLM: Audit NTLM authentication in this domain**: Enable all
* **Network security: Restrict NTLM: Outgoing NTLM traffic to remote servers**: Audit all

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Restricted Groups** to the following:

* **BUILTIN\Event Log Readers:** NT AUTHORITY\NETWORK SERVICE

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> System Services** to the following:

* **Windows Remote Management (WS-Management)**: Startup Mode: Automatic

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Advanced Audit Configuration** to the following:

* **Audit Credential Validation**: Success, Failure
* **Audit Other Account Logon Events**: Success, Failure
* **Audit Kerberos Authentication Service**: Success, Failure
* **Audit Kerberos Service Ticket Operations**: Success, Failure
* **Audit Computer Account Management**: Success, Failure
* **Audit Distribution Group Management**: Success, Failure
* **Audit Other Account Management Events**: Success, Failure
* **Audit Security Group Management**: Success, Failure
* **Audit User Account Management**: Success, Failure
* **Audit DPAPI Activity**: Success, Failure
* **Audit PNP Activity**: Success, Failure
* **Audit Process Creation**: Success, Failure
* **Audit Process Termination**: Success, Failure
* **Audit Detailed Directory Service Replication**: Success, Failure
* **Audit Directory Service Access**: Success, Failure
* **Audit Directory Service Changes**: Success, Failure
* **Audit Directory Service Replication**: Success, Failure
* **Audit Account Lockout**: Success, Failure
* **Audit User/Device Claims**: Success, Failure
* **Audit Group Membership**: Success, Failure
* **Audit Logoff**: Success, Failure
* **Audit Logon**: Success, Failure
* **Audit Other Logon/Logoff Events**: Success, Failure
* **Audit Special Logon**: Success, Failure
* **Audit Detailed File Share**: Failure
* **Audit File Share**: Success, Failure
* **Audit File System**: Success, Failure
* **Audit Filtering Platform Connection**: Failure
* **Audit Other Object Access Events**: Success, Failure
* **Audit Registry**: Success, Failure
* **Audit Removable Storage**: Success, Failure
* **Audit Audit Policy Change**: Success, Failure
* **Audit Authentication Policy Change**: Success, Failure
* **Audit MPSSVC Rule-Level Policy Change**: Success, Failure
* **Audit Other Policy Change Events**: Success, Failure
* **Audit Non Sensitive Privilege Use**: Failure
* **Audit Sensitive Privilege Use**: Success, Failure
* **Audit Other System Events**: Success, Failure
* **Audit Security State Change**: Success, Failure
* **Audit Security System Extension**: Success, Failure
* **Audit System Integrity**: Success, Failure

Set the following setting **Computer Configuration -> Administrative Templates -> System -> Audit Process Creation** to the following:

* **Include command line in process creation events**: Enabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 1048576

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 4194304

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 1048576

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Windows PowerShell** to the following:

* **Turn on Module Logging**: Enabled
  * **Module Names**: *
* **Turn on Powershell Script Block Logging**: Enabled
  * **Log script block invocation start / stop events**: Disabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components ->  Windows Remote Management (WinRM)/WinRM Client** to the following:

* **Allow Basic Authentication**: Disabled
* **Allow CredSSP authentication**: Disabled
* **Allow unencrypted traffic**: Disabled
* **Disallow Kerberos authentication**: Disabled
* **Disallow Negotiate authentication**: Disabled
* **Disallow Digest authentication**: Enabled
* **Trusted Hosts:** Disabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components ->  Windows Remote Management (WinRM)/WinRM Service** to the following:

* **Allow Basic Authentication**: Disabled
* **Allow CredSSP authentication**: Disabled
* **Allow Remote Server Management through WinRM**: Enabled
  * **IPV4 filter**: *
* **Allow unencrypted traffic**: Disabled
* **Disallow Kerberos authentication**: Disabled
* **Disallow Negotiate authentication**: Disabled
* **Disallow WinRM from storing RunAs credentials**: Enabled
* **Specify channel biding token hardening level**: Relaxed
* **Turn on Compatibility HTTP Listener**: Disabled
* **Turn on Compatibility HTTPS Listener**: Disabled


Member Server Enhanced Auditing Policy
-----

**Description**: This policy enables the high-security auditing recommendations by Microsoft. This is applied to all member servers and will configure the following settings:

* Audit categories for event logs.
* Appropriate Event Log Readers group membership for WEF.
* Command line auditing for process creation events.
* Secure Windows Remote Management (WinRM) defaults.
* Event log retention and size.

**Where to Link**: All OUs containing member servers or virtual servers.

**Caveats**: Tweak auditing policies according to your own risk tolerance.

**Configuration**:

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options** to the following:

* **Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings**: Enabled

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Restricted Groups** to the following:

* **BUILTIN\Event Log Readers:** NT AUTHORITY\NETWORK SERVICE

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> System Services** to the following:

* **Windows Remote Management (WS-Management)**: Startup Mode: Automatic

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Advanced Audit Configuration** to the following:

* **Audit Credential Validation**: Success, Failure
* **Audit Other Account Logon Events**: Success, Failure
* **Audit Security Group Management**: Success, Failure
* **Audit User Account Management**: Success, Failure
* **Audit DPAPI Activity**: Success, Failure
* **Audit PNP Activity**: Success, Failure
* **Audit Process Creation**: Success, Failure
* **Audit Process Termination**: Success, Failure
* **Audit Account Lockout**: Success, Failure
* **Audit User/Device Claims**: Success, Failure
* **Audit Group Membership**: Success, Failure
* **Audit Logoff**: Success, Failure
* **Audit Logon**: Success, Failure
* **Audit Other Logon/Logoff Events**: Success, Failure
* **Audit Special Logon**: Success, Failure
* **Audit Detailed File Share**: Success, Failure
* **Audit File Share**: Success, Failure
* **Audit File System**: Success, Failure
* **Audit Filtering Platform Connection**: Failure
* **Audit Other Object Access Events**: Success, Failure
* **Audit Registry**: Success, Failure
* **Audit Removable Storage**: Success, Failure
* **Audit Audit Policy Change**: Success, Failure
* **Audit Authentication Policy Change**: Success, Failure
* **Audit MPSSVC Rule-Level Policy Change**: Success, Failure
* **Audit Other Policy Change Events**: Success, Failure
* **Audit Non Sensitive Privilege Use**: Failure
* **Audit Sensitive Privilege Use**: Success, Failure
* **Audit Other System Events**: Success, Failure
* **Audit Security State Change**: Success, Failure
* **Audit Security System Extension**: Success, Failure
* **Audit System Integrity**: Success, Failure

Set the following setting **Computer Configuration -> Administrative Templates -> System -> Audit Process Creation** to the following:

* **Include command line in process creation events**: Enabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 1048576

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 4194304

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 1048576

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Windows PowerShell** to the following:

* **Turn on Module Logging**: Enabled
  * **Module Names**: *
* **Turn on Powershell Script Block Logging**: Enabled
  * **Log script block invocation start / stop events**: Disabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components ->  Windows Remote Management (WinRM)/WinRM Client** to the following:

* **Allow Basic Authentication**: Disabled
* **Allow CredSSP authentication**: Disabled
* **Allow unencrypted traffic**: Disabled
* **Disallow Kerberos authentication**: Disabled
* **Disallow Negotiate authentication**: Disabled
* **Disallow Digest authentication**: Enabled
* **Trusted Hosts:** Disabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components ->  Windows Remote Management (WinRM)/WinRM Service** to the following:

* **Allow Basic Authentication**: Disabled
* **Allow CredSSP authentication**: Disabled
* **Allow Remote Server Management through WinRM**: Enabled
  * **IPV4 filter**: *
* **Allow unencrypted traffic**: Disabled
* **Disallow Kerberos authentication**: Disabled
* **Disallow Negotiate authentication**: Disabled
* **Disallow WinRM from storing RunAs credentials**: Enabled
* **Specify channel biding token hardening level**: Relaxed
* **Turn on Compatibility HTTP Listener**: Disabled
* **Turn on Compatibility HTTPS Listener**: Disabled


Workstation Enhanced Auditing Policy
-----

**Description**: This policy enables the high-security auditing recommendations by Microsoft. This is applied to all workstations and will configure the following settings:

* Audit categories for event logs.
* Appropriate Event Log Readers group membership for WEF.
* Command line auditing for process creation events.
* Secure Windows Remote Management (WinRM) defaults.
* Event log retention and size.

**Where to Link**: All OUs containing workstations or workstation virtual machines.

**Caveats**: Tweak auditing policies according to your own risk tolerance.

**Configuration**:

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options** to the following:

* **Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings**: Enabled

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Restricted Groups** to the following:

* **BUILTIN\Event Log Readers:** NT AUTHORITY\NETWORK SERVICE

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> System Services** to the following:

* **Windows Remote Management (WS-Management)**: Startup Mode: Automatic

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Advanced Audit Configuration** to the following:

* **Audit Credential Validation**: Success, Failure
* **Audit Other Account Logon Events**: Success, Failure
* **Audit Security Group Management**: Success, Failure
* **Audit User Account Management**: Success, Failure
* **Audit DPAPI Activity**: Success, Failure
* **Audit PNP Activity**: Success, Failure
* **Audit Process Creation**: Success, Failure
* **Audit Process Termination**: Success, Failure
* **Audit Account Lockout**: Success, Failure
* **Audit User/Device Claims**: Success, Failure
* **Audit Group Membership**: Success, Failure
* **Audit Logoff**: Success, Failure
* **Audit Logon**: Success, Failure
* **Audit Other Logon/Logoff Events**: Success, Failure
* **Audit Special Logon**: Success, Failure
* **Audit Detailed File Share**: Success, Failure
* **Audit File Share**: Success, Failure
* **Audit File System**: Success, Failure
* **Audit Filtering Platform Connection**: Failure
* **Audit Other Object Access Events**: Success, Failure
* **Audit Registry**: Success, Failure
* **Audit Removable Storage**: Success, Failure
* **Audit Audit Policy Change**: Success, Failure
* **Audit Authentication Policy Change**: Success, Failure
* **Audit MPSSVC Rule-Level Policy Change**: Success, Failure
* **Audit Other Policy Change Events**: Success, Failure
* **Audit Other System Events**: Success, Failure
* **Audit Security State Change**: Success, Failure
* **Audit Security System Extension**: Success, Failure
* **Audit System Integrity**: Success, Failure

Set the following setting **Computer Configuration -> Administrative Templates -> System -> Audit Process Creation** to the following:

* **Include command line in process creation events**: Enabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 1048576

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 4194304

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System** to the following:

* **Back up log automatically when full:** Disabled
* **Control Event Log behavior when log file reaches its maximum size**: Disabled
* **Specify the maximum log file size (KB)**: 1048576

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components -> Windows PowerShell** to the following:

* **Turn on Module Logging**: Enabled
  * **Module Names**: *
* **Turn on Powershell Script Block Logging**: Enabled
  * **Log script block invocation start / stop events**: Disabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components ->  Windows Remote Management (WinRM)/WinRM Client** to the following:

* **Allow Basic Authentication**: Disabled
* **Allow CredSSP authentication**: Disabled
* **Allow unencrypted traffic**: Disabled
* **Disallow Kerberos authentication**: Disabled
* **Disallow Negotiate authentication**: Disabled
* **Disallow Digest authentication**: Enabled
* **Trusted Hosts:** Disabled

Set the following setting **Computer Configuration -> Administrative Templates -> Windows Components ->  Windows Remote Management (WinRM)/WinRM Service** to the following:

* **Allow Basic Authentication**: Disabled
* **Allow CredSSP authentication**: Disabled
* **Allow Remote Server Management through WinRM**: Enabled
  * **IPV4 filter**: *
* **Allow unencrypted traffic**: Disabled
* **Disallow Kerberos authentication**: Disabled
* **Disallow Negotiate authentication**: Disabled
* **Disallow WinRM from storing RunAs credentials**: Enabled
* **Specify channel biding token hardening level**: Relaxed
* **Turn on Compatibility HTTP Listener**: Disabled
* **Turn on Compatibility HTTPS Listener**: Disabled

### Windows Event Collector Configuration Policy

**Description**: This policy enables configures the Windows Event Collector service. This is applied to all WEC servers and will configure the following settings:

* Enable the WEC service.
* Configure the firewall to allow incoming WinRM connections.

**Where to Link**: All OUs containing WEC servers, with an optional WMI filter.

**Caveats**: Firewall ports may need to be updated for 5986 if using HTTPS.

**Configuration**:

Set the following setting **Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security** to the following:

* **Inbound Rule: Windows Remote Management (HTTP-In)**: Allow

Set the following setting **Computer Configuration -> Preferences -> Control Panel Settings -> Services** to the following:

* **Wecsvc**: Create a new service entry.
  * **Service Name**: Wecsvc
  * **Action**: Start service
  * **Startup type**: AUTODELAYED

Site-Based Powershell Transcription Policy
-----

**Description**: This policy enables configures the powershell transcription location. This will configure the following settings:

* Enable Powershell Transcription.
* Configure Powershell Transcription to a target SMB server.

**Where to Link**: Variable. Recommended to use site-based servers and site-based GPOs.

**Caveats**: This requires a configured SMB server to accept powershell transcription logs.

**Configuration**:

Set the following setting **Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows PowerShell** to the following:

* **Turn on PowerShell Transcription**: Enabled
  * **Transcript output directory**: \\\\SERVERNAME\pslogs
  * **Include invocation headers**: Enabled

Site-Based WEF Server Policy
-----

**Description**: This policy enables configures the WEF management server location. This will configure the following settings:

* Configure clients to connect to a WEF server for subscription and event management.

**Where to Link**: Variable. Recommended to use site-based servers and site-based GPOs.

**Caveats**: This requires a configured WEC server.

**Configuration**:

Set the following setting **Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Event Forwarding** to the following:

* **Configure target Subscription Manager**: Enabled
  * **SubscriptionManagers**: Server=http://SERVERNAME:5985/wsman/SubscriptionManager/WEC
