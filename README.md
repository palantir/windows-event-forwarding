# Windows Event Forwarding Guidance

## About This Repository
Over the past few years, Palantir has a maintained an internal Windows Event Forwarding (WEF) pipeline for generating and centrally collecting logs of forensic and security value from Microsoft Windows hosts. Once these events are collected and indexed, alerting and detection strategies (ADS) can be constructed not only on high-fidelity security events (e.g. log deletion), but also for deviations from normalcy, such as unusual service account access, access to sensitive filesystem or registry locations, or installation of malware persistence.

The goal of this project is to provide the necessary building blocks for organizations to rapidly evaluate and deploy WEF to a production environment, and centralize public efforts to improve WEF subscriptions and encourage adoption. While WEF has become more popular in recent years, it is still dramatically underrepresented in the community, and it is our hope that this project may encourage others to adopt it for incident detection and response purposes. We acknowledge the efforts that Microsoft, IAD, and other contributors have made to this space and wish to thank them for providing many of the subscriptions, ideas, and techniques that will be covered in this post.

## About Windows Event Forwarding
Windows Event Forwarding (WEF) is a powerful log forwarding solution integrated within modern versions of Microsoft Windows. One of the most comprehensive descriptions of WEF can be found on the [Microsoft Docs page here](https://docs.microsoft.com/en-us/windows/threat-protection/use-windows-event-forwarding-to-assist-in-instrusion-detection), but is summarized as follows:

* Windows Event Forwarding allows for event logs to be sent, either via a push or pull mechanism, to one or more centralized Windows Event Collector (WEC) servers.
* WEF is agent-free, and relies on native components integrated into the operating system. WEF is supported for both workstation and server builds of Windows.
* WEF supports mutual authentication and encryption through Kerberos (in a domain), or can be extended through the usage of TLS (additional authentication or for non-domain joined machines).
* WEF has a rich XML-based language that can control which event IDs are submitted, suppress noisy events, batch events together, and send events as quickly or slowly as desired. Subscription XML supports a subset of [XPath](https://msdn.microsoft.com/en-us/library/windows/desktop/dd996910(v=vs.85).aspx#limitations), which simplifies the process of writing expressions to select the events you're interested in.

## Repository Layout
This repository is organized as follows:
* [**WEF Subscriptions**](./wef-subscriptions/): Subscriptions are the core component of WEF that determine which events should be forwarded, how they should be stored, and at what cadence and batch size they are sent.
* [**Windows Event Channels**](./windows-event-channels/): Event Channels are queues that can be used for collecting and storing event log entries on a collector server.
* [**Group Policy Objects**](./group-policy-objects/): GPO recommendations for configuring auditing, enabling windows event collection/forwarding, etc.
* [**AutorunsToWinEventLog**](./AutorunsToWinEventLog/): A script leveraging existing WEF infrastructure and Sysinternals' Autoruns to collect persistence and auto-start related artifacts.

### Using This Repository
**Note**: We recommend that you spin up a lab environment before deploying any of these configurations, scripts, or subscriptions to a production environment.

1. Download the repository and review the contents.
2. Deploy auditing GPOs to your fleet to start collecting security-critical events.
3. Configure one or more Windows Event Collector servers. Apply the associated GPOs.
4. (Optional) Configure your WEC server(s) to function as a powershell transcription logging target.
5. Deploy the windows event channels to the WEC server(s).
6. Load one or more WEF subscriptions on the WEC server(s).
7. Start collecting data and hunting badness.

## Contributing
Contributions, fixes, and improvements can be submitted directly against this project as a GitHub issue or pull request. When contributing an update to CustomEventChannels.man, please do not include the compiled .DLL for security reasons. Once your pull request has been merged, we will compile the updated manifest into a DLL and add it to the repository. 

## License
MIT License

Copyright (c) 2018 Palantir Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Further Reading and Acknowledgements

Many open source publications were referenced for the development of these Subscriptions, and we wish to acknowledge those who have contributed to this effort.

* [Palantir Medium: Windows Event Forwarding for Network Defense](https://medium.com/@palantir/windows-event-forwarding-for-network-defense-cb208d5ff86f)
* [Microsoft Windows Event Forwarding to help with intrusion detection](https://docs.microsoft.com/en-us/windows/threat-protection/use-windows-event-forwarding-to-assist-in-instrusion-detection)
* [Monitoring What Matters](https://blogs.technet.microsoft.com/jepayne/2015/11/23/monitoring-what-matters-windows-event-forwarding-for-everyone-even-if-you-already-have-a-siem/)
* [Spotting the Adversary](https://www.iad.gov/iad/library/reports/spotting-the-adversary-with-windows-event-log-monitoring.cfm)
* [Creating Custom Windows Event Forwarding Logs](https://blogs.technet.microsoft.com/russellt/2016/05/18/creating-custom-windows-event-forwarding-logs/)
* [Windows Logging Cheat Sheet](https://static1.squarespace.com/static/552092d5e4b0661088167e5c/t/580595db9f745688bc7477f6/1476761074992/Windows+Logging+Cheat+Sheet_ver_Oct_2016.pdf)
* [Event Forwarding Guidance](https://github.com/iadgov/Event-Forwarding-Guidance/)
* [Windows Event Log Reference](https://msdn.microsoft.com/en-us/library/aa385785(v=vs.85).aspx):
* [Windows Event Log Consuming Events](https://msdn.microsoft.com/en-us/library/dd996910(v=vs.85).aspx)
* [Advanced XML Filtering](https://blogs.technet.microsoft.com/askds/2011/09/26/advanced-xml-filtering-in-the-windows-event-viewer/)
* [XPath Documentation](https://www.w3.org/TR/xpath/)
* [Exploit Guard Event Views](https://docs.microsoft.com/en-us/windows/threat-protection/windows-defender-exploit-guard/event-views-exploit-guard)
