# CLAUDE.md

Guidance for [Claude Code](https://claude.com/claude-code) when working in this repository.

## What this repository is

A collection of Windows Event Forwarding (WEF) resources for security monitoring: subscription definitions, a custom event channel manifest, and supporting tooling. It is **configuration and documentation, not an application**. There is no build system, package manifest, or test runner, and nothing here is compiled in CI.

The artifacts are consumed by Windows infrastructure:

- XML subscriptions are imported on a Windows Event Collector (WEC) server with `wecutil`.
- The event channel manifest is compiled to a DLL and registered with `wevtutil`.
- The PowerShell tooling runs on monitored endpoints.

Changes are validated by review and by the checks below, not by a test suite.

## Layout

| Path | Contents |
| --- | --- |
| `wef-subscriptions/` | One XML subscription per event category. The `<LogFile>` element names the custom channel each subscription writes to. |
| `windows-event-channels/` | `CustomEventChannels.man` (the channel manifest), the compiled `CustomEventChannels.dll`, and `validate-event-channels.py`. |
| `AutorunsToWinEventLog/` | PowerShell that writes Sysinternals Autoruns output into an event log, plus install/uninstall scripts. |
| `group-policy-objects/` | GPO documentation for configuring audit policy and WEF on endpoints. |
| `WEF-Event-Mappings.md` | Large reference table mapping event IDs to subscriptions and channels. |

## Checks to run

Before proposing changes to the manifest, the channel documentation, or any subscription:

```
python3 windows-event-channels/validate-event-channels.py
```

This cross-checks the manifest, the channel list in `windows-event-channels/README.md`, and every subscription's `<LogFile>` target. It is standard-library only and exits non-zero on failure. Run it from anywhere; it resolves paths relative to its own location.

For changes to PowerShell:

```
pwsh -Command "Invoke-ScriptAnalyzer -Path AutorunsToWinEventLog/"
```

PSScriptAnalyzer is not vendored here and is not required, but run it if available.

## Conventions

**Event channels.** Channels are named `WEC#-Name`, where `#` identifies the owning provider. Each provider imports the `System` channel, consuming one of its 8 slots, so a provider may define at most 7 channels of its own. The `symbol` attribute is the channel name with underscores in place of hyphens — it becomes a C# identifier at compile time, so a hyphen there breaks the build. Channels must be `type="Operational"` and `enabled="true"`.

**Provider GUIDs are load-bearing.** They are compiled into the DLL and registered on every deployed collector. Never change an existing provider's GUID; doing so orphans the channels registered under the old one. Providers `WEC8` through `WEC15` are deliberately empty and exist as headroom for new channels.

**Subscriptions.** Each file in `wef-subscriptions/` needs a `SubscriptionId` that is unique across the directory. Several subscriptions may share one `<LogFile>` channel on purpose — the four Exploit Guard subscriptions all write to `WEC6-Exploit-Guard` — so sharing a channel is not itself a defect. What does break things is a `<LogFile>` naming a channel the manifest does not define: the subscription appears active while collecting nothing, with no error. The validator catches that case.

**Documentation must track the manifest.** Adding a channel means editing `CustomEventChannels.man`, the channel list and provider table in `windows-event-channels/README.md`, and usually a subscription. The validator enforces that these agree.

## Things to be careful about

- **Do not modify `CustomEventChannels.dll`.** It is a compiled binary that can only be regenerated on Windows with the Windows SDK (`mc.exe`, `rc.exe`, `csc.exe`). Editing the `.man` file alone does not change what a collector registers; the DLL must be rebuilt and redeployed. If a change requires recompiling, say so explicitly rather than implying the `.man` edit is sufficient.
- **This repository cannot be fully validated on macOS or Linux.** The Python validator runs anywhere, but compiling the manifest and importing subscriptions require Windows. Do not claim a change is verified end-to-end when only the cross-checks have run.
- **Event IDs and channel names are security-critical.** A typo silently drops a telemetry source rather than raising an error. Verify names against `CustomEventChannels.man` rather than against memory or another document.
- **Keep diffs minimal in `wef-subscriptions/`.** These files are read by operators comparing against deployed state; incidental reformatting makes real changes hard to review.

## Commit and PR conventions

Existing history uses short imperative subjects ("Updating Exploit Guard subscriptions.", "Fixing exploit guard ep subscriptions."). Match that style. Keep unrelated changes in separate commits so maintainers can take them independently.
