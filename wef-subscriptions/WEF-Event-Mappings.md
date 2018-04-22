# WEF Event Mappings

This is a mostly-comprehensive table of all the event codes, WEF subscriptions, and WEC channels used in this project. Event codes for non-standard logs will be added as separate table entries.

The following template is used:

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|The Auditing Type|The Event Code|The Event Name|If DCs are expected to log the event.|If servers are expected to log the event.|If workstations are expected to log the event.|Presence of a WEF subscription. (N/A = No Subscription)|The WEF subscription name.|The WEC channel name.|Testing Status.|Testing Status.|Testing Status.|

**Note**: Some WEF subscriptions may include event IDs which are not expected to be seen in the wild (e.g. unused). The status of testing for these events have been defaulted to a pass.

## Credential Validation

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Credential Validation|4774|An account was mapped for logon.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Credential Validation|4775|An account could not be mapped for logon.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Credential Validation|4776|The computer attempted to validate the credentials for an account.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Credential Validation|4777|The domain controller failed to validate the credentials for an account.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|

## Kerberos Authentication Service

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Kerberos Authentication Service|4769|A Kerberos authentication ticket (TGT) was requested.|Yes|N/A|N/A|Yes|Kerberos|WEC-Authentication|Yes|N/A|N/A|
|Audit Kerberos Authentication Service|4770|Kerberos pre-authentication failed.|Yes|N/A|N/A|Yes|Kerberos|WEC-Authentication|Yes|N/A|N/A|
|Audit Kerberos Authentication Service|4773|A Kerberos authentication ticket request failed.|Yes|N/A|N/A|Yes|Kerberos|WEC-Authentication|Yes|N/A|N/A|

## Kerberos Service Ticket Operations

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Kerberos Service Ticket Operations|4769|A Kerberos service ticket was requested.|Yes|N/A|N/A|Yes|Kerberos|WEC-Authentication|Yes|N/A|N/A|
|Audit Kerberos Service Ticket Operations|4770|A Kerberos service ticket was renewed.|Yes|N/A|N/A|Yes|Kerberos|WEC-Authentication|Yes|N/A|N/A|
|Audit Kerberos Service Ticket Operations|4773|A Kerberos service ticket request failed.|Yes|N/A|N/A|Yes|Kerberos|WEC-Authentication|Yes|N/A|N/A|

## Computer Account Management

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Computer Account Management|4741|A computer account was created.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Computer Account Management|4742|A computer account was changed|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Computer Account Management|4743|A computer account was deleted.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|

## Distribution Group Management

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Distribution Group Management|4749|A security-disabled global group was created.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4750|A security-disabled global group was changed.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4751|A member was added to a security-disabled global group.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4752|A member was removed from a security-disabled global group.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4753|A security-disabled global group was deleted.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4759|A security-disabled universal group was created.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4760|A security-disabled universal group was changed.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4761|A member was added to a security-disabled universal group.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4762|A member was removed from a security-disabled universal group.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4763|A security-disabled universal group was deleted.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4744|A security-disabled local group was created.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4745|A security-disabled local group was changed.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4746|A member was added to a security-disabled local group.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4747|A member was removed from a security-disabled local group.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Distribution Group Management|4748|A security-disabled local group was deleted.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|

## Other Account Management

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Other Account Management Events|4782|The password hash an account was accessed.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit Other Account Management Events|4793|The Password Policy Checking API was called.|Yes|N/A|N/A|N/A|N/A|N/A|N/A|N/A|N/A|

## Security Group Management

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Security Group Management|4731|A security-enabled local group was created.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4732|A member was added to a security-enabled local group.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4733|A member was removed from a security-enabled local group.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4734|A security-enabled local group was deleted.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4735|A security-enabled local group was changed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4764|A group’s type was changed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4799|A security-enabled local group membership was enumerated.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4727|A security-enabled global group was created.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4737|A security-enabled global group was changed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4728|A member was added to a security-enabled global group.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4729|A member was removed from a security-enabled global group.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4730|A security-enabled global group was deleted.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4754|A security-enabled universal group was created.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4755|A security-enabled universal group was changed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4756|A member was added to a security-enabled universal group.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4757|A member was removed from a security-enabled universal group.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Security Group Management|4758|A security-enabled universal group was deleted.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|

## User Account Management

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit User Account Management|4720|A user account was created.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4722|A user account was enabled.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4723|An attempt was made to change an account's password.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4724|An attempt was made to reset an account's password.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4725|A user account was disabled.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4726|A user account was deleted.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4738|A user account was changed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4740|A user account was locked out.|Yes|Yes|Yes|Yes|Account-Lockout|WEC-Authentication|Yes|Yes|Yes|
|Audit User Account Management|4765|SID History was added to an account.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4766|An attempt to add SID History to an account failed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4767|A user account was unlocked.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4780|The ACL was set on accounts which are members of administrators groups.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4781|The name of an account was changed.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|4794|An attempt was made to set the Directory Services Restore Mode administrator password.|Yes|N/A|N/A|Yes|Account-Management|WEC3-Account-Management|Yes|N/A|N/A|
|Audit User Account Management|4798|A user's local group membership was enumerated.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|5376|Credential Manager credentials were backed up.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit User Account Management|5377|Credential Manager credentials were restored from a backup.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|

## DPAPI Activity

**Note:** These are not monitored or collected via WEF.

## PNP Activity

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit PNP Activity|6416|A new external device was recognized by the System|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|
|Audit PNP Activity|6419|A request was made to disable a device|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|
|Audit PNP Activity|6420|A device was disabled.|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|
|Audit PNP Activity|6421|A request was made to enable a device.|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|
|Audit PNP Activity|6422|A device was enabled.|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|
|Audit PNP Activity|6423|The installation of this device is forbidden by system policy.|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|
|Audit PNP Activity|6424|The installation of this device was allowed, after having previously been forbidden by policy.|Yes|Yes|Yes|Yes|Yes|WEC3-External-Devices|Yes|Yes|Yes|

## Process Creation

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Process Creation|4688|A new process has been created.|Yes|Yes|Yes|Yes|Process-Execution|WEC-Process-Execution|Yes|Yes|Yes|
|Audit Process Creation|4696|A primary token was assigned to process.|N/A|N/A|N/A|N/A|N/A|N/A|N/A|N/A|N/A|

## Process Termination

**Note:** These are not monitored or collected via WEF.

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Process Termination|4689|A process has exited.|N/A|N/A|N/A|N/A|N/A|N/A|N/A|N/A|N/A|

## RPC Events

**Note:** These are not monitored or collected via WEF.

## Detailed Directory Service Replication

**Note:** These are not monitored or collected via WEF.

## Directory Service Access

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Directory Service Access|4662|An operation was performed on an object.|Yes|N/A|N/A|Yes|Active-Directory|WEC7-Active-Directory|Yes|N/A|N/A|
|Audit Directory Service Access|4661|A handle to an object was requested.|Yes|N/A|N/A|N/A|N/A|N/A|N/A|N/A|N/A|

## Directory Service Changes

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Directory Service Changes|5136|A directory service object was modified.|Yes|N/A|N/A|Yes|Active-Directory|WEC7-Active-Directory|Yes|N/A|N/A|
|Audit Directory Service Changes|5137|A directory service object was created.|Yes|N/A|N/A|Yes|Active-Directory|WEC7-Active-Directory|Yes|N/A|N/A|
|Audit Directory Service Changes|5138|A directory service object was undeleted.|Yes|N/A|N/A|Yes|Active-Directory|WEC7-Active-Directory|Yes|N/A|N/A|
|Audit Directory Service Changes|5139|A directory service object was moved.|Yes|N/A|N/A|Yes|Active-Directory|WEC7-Active-Directory|Yes|N/A|N/A|
|Audit Directory Service Changes|5141|A directory service object was deleted.|Yes|N/A|N/A|Yes|Active-Directory|WEC7-Active-Directory|Yes|N/A|N/A|

## Directory Service Replication

**Note:** These are not monitored or collected via WEF.

## Account Lockout

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Account Lockout|4625|An account failed to log on.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|

## User/Device Claims

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit User/Device Claims|4626|User/Device claims information.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|

## Group Membership

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Group Membership|4627|Group membership information|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|

## IPSec Extended Mode

**Note:** These are not monitored or collected via WEF.

## IPSec Main Mode

**Note:** These are not monitored or collected via WEF.

## IPSec Quick Mode

**Note:** These are not monitored or collected via WEF.

## Logoff

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Logoff|4634|An account was logged off.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Logoff|4647|User initiated logoff.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|

## Logon

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Logon|4624|An account was successfully logged on.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Logon|4625|An account failed to log on.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Logon|4648|A logon was attempted using explicit credentials.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Logon|4675|SIDs were filtered.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|

## Network Policy Server

**Note:** These are not monitored or collected via WEF.

## Other Logon/Logoff Events

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Other Logon/Logoff Events|4649|A replay attack was detected.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|4778|A session was reconnected to a Window Station.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|4779|A session was disconnected from a Window Station.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|4800|The workstation was locked.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|4801|The workstation was unlocked.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|4802|The screen saver was invoked.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|4803|The screen saver was dismissed.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|5378|The requested credentials delegation was disallowed by policy.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Other Logon/Logoff Events|5632|A request was made to authenticate to a wireless network.|N/A|N/A|Yes|Yes|Wireless|WEC4-Wireless|N/A|N/A|Yes|
|Audit Other Logon/Logoff Events|5633|A request was made to authenticate to a wired network.|Yes|Yes|Yes|Yes|Wireless|WEC4-Wireless|Yes|Yes|Yes|

## Special Logon

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Special Logon|4964|Special groups have been assigned a new logon.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|
|Audit Special Logon|4672|Special privileges assigned to new logon.|Yes|Yes|Yes|Yes|Authentication|WEC-Authentication|Yes|Yes|Yes|

## Application Generated

**Note:** These are not monitored or collected via WEF.

## Certification Services

**Note:** These are not monitored or collected via WEF.

## Network Policy Server

**Note:** These are not monitored or collected via WEF.

## Detailed File Share

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Detailed File Share|5145|A network share object was checked to see whether client can be granted desired access.|Yes|Yes|Yes|Yes|Shares|WEC4-Shares|Yes|Yes|Yes|

## File Share

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit File Share|5140|A network share object was accessed|Yes|Yes|Yes|Yes|Shares|WEC4-Shares|Yes|Yes|Yes|
|Audit File Share|5142|A network share object was added.|Yes|Yes|Yes|Yes|Shares|WEC4-Shares|Yes|Yes|Yes|
|Audit File Share|5143|A network share object was modified.|Yes|Yes|Yes|Yes|Shares|WEC4-Shares|Yes|Yes|Yes|
|Audit File Share|5144|A network share object was deleted.|Yes|Yes|Yes|Yes|Shares|WEC4-Shares|Yes|Yes|Yes|
|Audit File Share|5168|SPN check for SMB/SMB2 failed.|Yes|Yes|Yes|Yes|Shares|WEC4-Shares|Yes|Yes|Yes|

## File System

**Note:** These events are covered by the generic **object manipulation** subscriptions and channels.

## Filtering Platform Connection

**Note:** These are not monitored or collected via WEF.

## Filtering Platform Packet Drop

**Note:** These are not monitored or collected via WEF.

## Handle Manipulation

**Note:** These events are covered by the generic **object manipulation** subscriptions and channels.

## Kernel Object

**Note:** These events are covered by the generic **object manipulation** subscriptions and channels.

## Other Object Access Events

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Other Object Access Events|4671|An application attempted to access a blocked ordinal through the TBS|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Object Access Events|4691|Indirect access to an object was requested.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Object Access Events|5148|The Windows Filtering Platform has detected a DoS attack and entered a defensive mode; packets associated with this attack will be discarded.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Object Access Events|5149|The DoS attack has subsided and normal processing is being resumed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Object Access Events|4698|A scheduled task was created.|Yes|Yes|Yes|Yes|Task-Scheduler|WEC2-Task-Scheduler|Yes|Yes|Yes|
|Audit Other Object Access Events|4699|A scheduled task was deleted.|Yes|Yes|Yes|Yes|Task-Scheduler|WEC2-Task-Scheduler|Yes|Yes|Yes|
|Audit Other Object Access Events|4700|A scheduled task was enabled.|Yes|Yes|Yes|Yes|Task-Scheduler|WEC2-Task-Scheduler|Yes|Yes|Yes|
|Audit Other Object Access Events|4701|A scheduled task was disabled.|Yes|Yes|Yes|Yes|Task-Scheduler|WEC2-Task-Scheduler|Yes|Yes|Yes|
|Audit Other Object Access Events|4702|A scheduled task was updated.|Yes|Yes|Yes|Yes|Task-Scheduler|WEC2-Task-Scheduler|Yes|Yes|Yes|
|Audit Other Object Access Events|5888|An object in the COM+ Catalog was modified.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Object Access Events|5889|An object was deleted from the COM+ Catalog.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Object Access Events|5890|An object was added to the COM+ Catalog.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|

## Registry

**Note:** Many of these events are covered by the generic **object manipulation** subscriptions and channels.

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Registry|4657|A registry value was modified.|Yes|Yes|Yes|Yes|Registry|WEC2-Registry|Yes|Yes|Yes|
|Audit Registry|5039|A registry key was virtualized.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|

## Removable Storage

**Note:** These events are covered by the generic **object manipulation** subscriptions and channels.

## SAM

**Note:** These events are covered by the generic **object manipulation** subscriptions and channels.

## Central Access Policy Staging

**Note:** These are not monitored or collected via WEF.

## Audit Policy Change

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Policy Change|4715|The audit policy (SACL) on an object was changed.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Audit Policy Change|4719|System audit policy was changed.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Policy Change|4817|Auditing settings on object were changed.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Audit Policy Change|4902|The Per-user audit policy table was created.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Policy Change|4906|The CrashOnAuditFail value has changed.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Policy Change|4907|Auditing settings on object were changed.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Audit Policy Change|4908|Special Groups Logon table modified.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Policy Change|4912|Per User Audit Policy was changed.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Policy Change|4904|An attempt was made to register a security event source.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Policy Change|4905|An attempt was made to unregister a security event source.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|

## Authentication Policy Change

**Note:** Some of these events are covered by the generic** object manipulation** subscriptions and channels.

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Authentication Policy Change|4706|A new trust was created to a domain.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4707|A trust to a domain was removed.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4716|Trusted domain information was modified.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4713|Kerberos policy was changed.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4717|System security access was granted to an account.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Authentication Policy Change|4718|System security access was removed from an account.|Yes|Yes|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Authentication Policy Change|4739|Domain Policy was changed.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4864|A namespace collision was detected.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4865|A trusted forest information entry was added.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4866|A trusted forest information entry was removed.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|
|Audit Authentication Policy Change|4867|A trusted forest information entry was modified.|Yes|Yes|Yes|Yes|Active-Directory|WEC7-Active-Directory|Yes|Yes|Yes|

## Authorization Policy Change

**Note:** Some of these events are covered by the generic** object manipulation** subscriptions and channels.

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Authorization Policy Change|4703|A user right was adjusted.|No|No|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Authorization Policy Change|4704|A user right was assigned.|No|No|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Authorization Policy Change|4705|A user right was removed.|No|No|Yes|Yes|Account-Management|WEC3-Account-Management|Yes|Yes|Yes|
|Audit Authorization Policy Change|4911|Resource attributes of the object were changed.|No|No|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Authorization Policy Change|4913|Central Access Policy on the object was changed.|No|No|Yes|N/A|N/A|N/A|N/A|N/A|N/A|

## Filtering Platform Policy Change

**Note:** These are not monitored or collected via WEF.

## MPSSVC Rule-Level Policy Change

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit MPSSVC Rule-Level Policy Change|4944|The following policy was active when the Windows Firewall started.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|MPSSVC Rule-Level Policy Change|4945|A rule was listed when the Windows Firewall started.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4946|A change has been made to Windows Firewall exception list. A rule was added.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4947|A change has been made to Windows Firewall exception list. A rule was modified.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4948|A change has been made to Windows Firewall exception list. A rule was deleted.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4949|Windows Firewall settings were restored to the default values.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4950|A Windows Firewall setting has changed.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|MPSSVC Rule-Level Policy Change|4951|A rule has been ignored because its major version number was not recognized by Windows Firewall.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4952|Parts of a rule have been ignored because its minor version number was not recognized by Windows Firewall. The other parts of the rule will be enforced.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4953|A rule has been ignored by Windows Firewall because it could not parse the rule.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4954|Windows Firewall Group Policy settings have changed. The new settings have been applied.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4956|Windows Firewall has changed the active profile.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4957|Windows Firewall did not apply the following rule:|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit MPSSVC Rule-Level Policy Change|4958|Windows Firewall did not apply the following rule because the rule referred to items not configured on this computer:|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|

## Other Policy Change Events

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Other Policy Change Events|4714|Encrypted data recovery policy was changed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|4819|Central Access Policies on the machine have been changed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|4826|Boot Configuration Data loaded.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Other Policy Change Events|4909|The local policy settings for the TBS were changed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|4910|The group policy settings for the TBS were changed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5063|A cryptographic provider operation was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5064|A cryptographic context operation was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5065|A cryptographic context modification was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5066|A cryptographic function operation was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5067|A cryptographic function modification was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5068|A cryptographic function provider operation was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5069|A cryptographic function property operation was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5070|A cryptographic function property modification was attempted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|5447|A Windows Filtering Platform filter has been changed.|Yes|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|
|Audit Other Policy Change Events|6144|Security policy in the group policy objects has been applied successfully.|Yes|Yes|Yes|Yes|Group-Policy-Errors|WEC2-Group-Policy-Errors|Yes|Yes|Yes|
|Audit Other Policy Change Events|6145|One or more errors occurred while processing security policy in the group policy objects.|Yes|Yes|Yes|Yes|Group-Policy-Errors|WEC2-Group-Policy-Errors|Yes|Yes|Yes|

## Sensitive Privilege Use

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Sensitive Privilege Use|4673|A privileged service was called.|Yes|Yes|Yes|Yes|Privilege-Use|WEC7-Privilege-Use|Yes|Yes|Yes|
|Audit Sensitive Privilege Use|4674|An operation was attempted on a privileged object.|Yes|Yes|Yes|Yes|Privilege-Use|WEC7-Privilege-Use|Yes|Yes|Yes|
|Audit Sensitive Privilege Use|4985|The state of a transaction has changed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|

## Non-Sensitive Privilege Use

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Non-Sensitive Privilege Use|4673|A privileged service was called.|Yes|Yes|Yes|Yes|Privilege-Use|WEC7-Privilege-Use|Yes|Yes|Yes|
|Audit Non-Sensitive Privilege Use|4674|An operation was attempted on a privileged object.|Yes|Yes|Yes|Yes|Privilege-Use|WEC7-Privilege-Use|Yes|Yes|Yes|
|Audit Non-Sensitive Privilege Use|4985|The state of a transaction has changed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|

## Other Privilege Use Events

**Note:** These are not monitored or collected via WEF.

## IPSec Driver

**Note:** These are not monitored or collected via WEF.

## Filtering Platform Policy Change

**Note:** These are not monitored or collected via WEF.

## Other System Events

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Other System Events|5024|The Windows Firewall Service has started successfully.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5025|The Windows Firewall Service has been stopped.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5027|The Windows Firewall Service was unable to retrieve the security policy from local storage. The service will continue enforcing the current policy.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5028|The Windows Firewall Service was unable to parse the new security policy. The service will continue with currently enforced policy.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5029|The Windows Firewall Service failed to initialize the driver. The service will continue to enforce the current policy.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5030|The Windows Firewall Service failed to start.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5032|Windows Firewall was unable to notify the user that it blocked an application from accepting incoming connections on the network.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5033|The Windows Firewall Driver has started successfully.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5034|The Windows Firewall Driver was stopped.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5035|The Windows Firewall Driver failed to start.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5037|The Windows Firewall Driver detected critical runtime error. Terminating.|Yes|Yes|Yes|Yes|Firewall|WEC3-Firewall|Yes|Yes|Yes|
|Audit Other System Events|5058|Key file operation.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|5059|Key migration operation.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6400|BranchCache: Received an incorrectly formatted response while discovering availability of content.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6401|BranchCache: Received invalid data from a peer. Data discarded.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6402|BranchCache: The message to the hosted cache offering it data is incorrectly formatted.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6403|BranchCache: The hosted cache sent an incorrectly formatted response to the client.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6404|BranchCache: Hosted cache could not be authenticated using the provisioned SSL certificate.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6405|BranchCache: %2 instance(s) of event id %1 occurred.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6406|%1 registered to Windows Firewall to control filtering for the following: %2|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6407|1%|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6408|Registered product %1 failed and Windows Firewall is now controlling the filtering for %2|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|Audit Other System Events|6409|BranchCache: A service connection point object could not be parsed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|

## Security State Change

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Security State Change|4608|Windows is starting up|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|
|Audit Security State Change|4616|The system time was changed|Yes|Yes|Yes|Yes|System-Time-Change|WEC4-System-Time-Change|Yes|Yes|Yes|
|Audit Security State Change|4621|Administrator recovered system from CrashOnAuditFail.|Yes|Yes|Yes|Yes|Operating-System|WEC5-Operating-System|Yes|Yes|Yes|

## Security System Extension

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Audit Security System Extension|4610|An authentication package has been loaded by the Local Security Authority.|Yes|Yes|Yes|Yes|System-Time-Change|WEC4-System-Time-Change|Yes|Yes|Yes|
|Audit Security System Extension|4611|A trusted logon process has been registered with the Local Security Authority.|Yes|Yes|Yes|Yes|System-Time-Change|WEC4-System-Time-Change|Yes|Yes|Yes|
|Audit Security System Extension|4614|A notification package has been loaded by the Security Account Manager.|Yes|Yes|Yes|Yes|System-Time-Change|WEC4-System-Time-Change|Yes|Yes|Yes|
|Audit Security System Extension|4622|A security package has been loaded by the Local Security Authority.|Yes|Yes|Yes|Yes|System-Time-Change|WEC4-System-Time-Change|Yes|Yes|Yes|
|Audit Security System Extension|4697|A service was installed in the system.|Yes|Yes|Yes|Yes|System-Time-Change|WEC4-System-Time-Change|Yes|Yes|Yes|

## System Integrity

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|System Integrity|4612|Internal resources allocated for the queuing of audit messages have been exhausted, leading to the loss of some audits.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|4615|Invalid use of LPC port.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|4618|A monitored security event pattern has occurred.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|4816|RPC detected an integrity violation while decrypting an incoming message.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|5038|Code integrity determined that the image hash of a file is not valid. The file could be corrupt due to unauthorized modification or the invalid hash could indicate a potential disk device error.|Yes|Yes|Yes|Yes|Code-Integrity|WEC-Code-Integrity|Yes|Yes|Yes|
|System Integrity|5056|A cryptographic self-test was performed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|5062|A kernel-mode cryptographic self-test was performed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|5057|A cryptographic primitive operation failed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|5060|Verification operation failed.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|5061|Cryptographic operation.|Yes|Yes|Yes|N/A|N/A|N/A|N/A|N/A|N/A|
|System Integrity|6281|Code Integrity determined that the page hashes of an image file are not valid. The file could be improperly signed without page hashes or corrupt due to unauthorized modification. The invalid hashes could indicate a potential disk device error.|Yes|Yes|Yes|Yes|Code-Integrity|WEC-Code-Integrity|Yes|Yes|Yes|
|System Integrity|6410|Code integrity determined that a file does not meet the security requirements to load into a process.|Yes|Yes|Yes|Yes|Code-Integrity|WEC-Code-Integrity|Yes|Yes|Yes|

## Other Events

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Other Events|1100|The event logging service has shut down.|Yes|Yes|Yes|Yes|Event-Log-Diagnostics|WEC3-Windows-Diagnostics|Yes|Yes|Yes|
|Other Events|1102|The audit log was cleared.|Yes|Yes|Yes|Yes|Log-Deletion-Security|WEC5-Log-Deletion-Security|Yes|Yes|Yes|
|Other Events|1104|The security log is now full.|Yes|Yes|Yes|Yes|Event-Log-Diagnostics|WEC3-Windows-Diagnostics|Yes|Yes|Yes|
|Other Events|1105|Event log automatic backup.|Yes|Yes|Yes|Yes|Event-Log-Diagnostics|WEC3-Windows-Diagnostics|Yes|Yes|Yes|
|Other Events|1108|The event logging service encountered an error while processing an incoming event published from %1|Yes|Yes|Yes|Yes|Event-Log-Diagnostics|WEC3-Windows-Diagnostics|Yes|Yes|Yes|

## Object Manipulation Events

|Event Type|Event Code|Event Name|Logging: DCs|Logging: Servers|Logging: Workstations|Subscription|Subscription Name|Subscription Channel|Reporting: DCs|Reporting: Servers|Reporting: Workstations|
|---|---|---|---|---|---|---|---|---|---|---|---|
|Multiple|4656|A handle to an object was requested.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Multiple|4658|The handle to an object was closed.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Multiple|4660|An object was deleted.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Multiple|4663|An attempt was made to access an object.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
|Multiple|4670|Permissions on an object were changed.|Yes|Yes|Yes|Yes|Object-Manipulation|WEC2-Object-Manipulation|Yes|Yes|Yes|
