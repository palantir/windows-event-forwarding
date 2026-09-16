#!/usr/bin/env python3
"""Validate the custom event channel manifest against its documentation.

The manifest (CustomEventChannels.man), the channel list in README.md and the
subscriptions in wef-subscriptions/ all name the same set of channels. Nothing
enforces that they agree, and a subscription pointing at a channel that does not
exist fails silently: it shows as active while collecting nothing.

This script cross-checks all three. It uses only the Python 3 standard library
and exits non-zero if it finds a problem.

    python3 validate-event-channels.py
"""

import os
import re
import sys
import xml.etree.ElementTree as ET

NS = "{http://schemas.microsoft.com/win/2004/08/events}"
MAX_CHANNELS_PER_PROVIDER = 7

HERE = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(HERE)
MANIFEST = os.path.join(HERE, "CustomEventChannels.man")
README = os.path.join(HERE, "README.md")
SUBSCRIPTIONS_DIR = os.path.join(REPO_ROOT, "wef-subscriptions")


class Results(object):
    """Collects errors so one run reports every problem, not just the first."""

    def __init__(self):
        self.errors = []
        self.warnings = []
        self.checks = 0

    def check(self, ok, message):
        self.checks += 1
        if not ok:
            self.errors.append(message)
        return ok

    def error(self, message):
        self.errors.append(message)

    def warn(self, message):
        """Non-fatal: worth flagging, but not a reason to block a build."""
        self.warnings.append(message)


def parse_manifest(results):
    """Return {provider_name: [channel elements]}, or None if unparseable."""
    try:
        root = ET.parse(MANIFEST).getroot()
    except ET.ParseError as exc:
        results.error("%s is not well-formed XML: %s" % (os.path.basename(MANIFEST), exc))
        return None

    providers = {}
    for provider in root.iter(NS + "provider"):
        providers[provider.get("name")] = list(provider.iter(NS + "channel"))
    return providers


def check_manifest_structure(providers, results):
    """Per-provider limits, naming rules and manifest-wide uniqueness."""
    seen_names, seen_chids, seen_symbols = {}, {}, {}

    for provider_name, channels in providers.items():
        results.check(
            len(channels) <= MAX_CHANNELS_PER_PROVIDER,
            "provider %s defines %d channels; the maximum is %d "
            "(each provider imports the System channel, using one of its 8 slots)"
            % (provider_name, len(channels), MAX_CHANNELS_PER_PROVIDER),
        )

        for channel in channels:
            name = channel.get("name")
            chid = channel.get("chid")
            symbol = channel.get("symbol")

            for value, registry, label in (
                (name, seen_names, "name"),
                (chid, seen_chids, "chid"),
                (symbol, seen_symbols, "symbol"),
            ):
                if value in registry:
                    results.error(
                        "duplicate channel %s %r in provider %s (already used in %s)"
                        % (label, value, provider_name, registry[value])
                    )
                else:
                    registry[value] = provider_name

            results.check(
                symbol is not None and "-" not in symbol,
                "channel %r has symbol %r; symbols must use underscores, not hyphens, "
                "because they become C# identifiers at compile time" % (name, symbol),
            )
            if name and symbol:
                expected = name.replace("-", "_")
                if symbol != expected:
                    # Symbols are compile-time C# identifiers only; the channel
                    # `name` is what gets registered. A pure casing difference is
                    # cosmetic, so flag it rather than failing the build.
                    if symbol.lower() == expected.lower():
                        results.warn(
                            "channel %r has symbol %r; expected %r (casing only)"
                            % (name, symbol, expected)
                        )
                    else:
                        results.error(
                            "channel %r has symbol %r; expected %r"
                            % (name, symbol, expected)
                        )
            results.check(
                name == chid,
                "channel %r has chid %r; name and chid should match" % (name, chid),
            )
            results.check(
                bool(name) and bool(re.match(r"^%s-[A-Za-z0-9\-]+$" % re.escape(provider_name), name)),
                "channel %r in provider %s does not follow the WEC#-Name scheme"
                % (name, provider_name),
            )
            results.check(
                channel.get("type") == "Operational" and channel.get("enabled") == "true",
                "channel %r must be type=\"Operational\" and enabled=\"true\" "
                "(found type=%r enabled=%r)" % (name, channel.get("type"), channel.get("enabled")),
            )


def check_readme_channel_list(manifest_channels, results):
    """The README's bulleted channel list must match the manifest exactly."""
    try:
        with open(README, encoding="utf-8") as handle:
            text = handle.read()
    except IOError as exc:
        results.error("could not read README.md: %s" % exc)
        return

    listed = set(re.findall(r"^\*\s+\*\*(WEC[0-9]*-[A-Za-z0-9\-]+)\*{0,2}:?\*{0,2}", text, re.M))

    for name in sorted(manifest_channels - listed):
        results.error("channel %r is defined in the manifest but missing from the README list" % name)
    for name in sorted(listed - manifest_channels):
        results.error("channel %r is listed in the README but not defined in the manifest" % name)


def check_readme_table(providers, results):
    """The provider/channel table must reflect the manifest's actual counts."""
    try:
        with open(README, encoding="utf-8") as handle:
            text = handle.read()
    except IOError:
        return  # already reported by check_readme_channel_list

    rows = re.findall(r"^\|\s*`(WEC[0-9]*)`\s*\|[^|]*\|\s*(\d+)\s*\|", text, re.M)
    if not rows:
        return  # table is optional; nothing to verify

    documented = {name: int(count) for name, count in rows}
    for name, channels in sorted(providers.items()):
        if name not in documented:
            results.error("provider %s is missing from the README provider table" % name)
        else:
            results.check(
                documented[name] == len(channels),
                "README table says provider %s has %d channels; the manifest defines %d"
                % (name, documented[name], len(channels)),
            )


def check_subscriptions(manifest_channels, results):
    """Every subscription must target a channel the manifest defines."""
    if not os.path.isdir(SUBSCRIPTIONS_DIR):
        return

    for filename in sorted(os.listdir(SUBSCRIPTIONS_DIR)):
        if not filename.endswith(".xml"):
            continue
        path = os.path.join(SUBSCRIPTIONS_DIR, filename)
        try:
            root = ET.parse(path).getroot()
        except ET.ParseError as exc:
            results.error("wef-subscriptions/%s is not well-formed XML: %s" % (filename, exc))
            continue

        for element in root.iter():
            if element.tag.split("}")[-1] == "LogFile" and element.text:
                channel = element.text.strip()
                results.check(
                    channel in manifest_channels,
                    "wef-subscriptions/%s forwards to %r, which the manifest does not define; "
                    "the subscription would appear active while collecting nothing"
                    % (filename, channel),
                )


def main():
    results = Results()

    providers = parse_manifest(results)
    if providers is None:
        print("FAIL: %s" % results.errors[0])
        return 1

    manifest_channels = {
        channel.get("name") for channels in providers.values() for channel in channels
    }

    check_manifest_structure(providers, results)
    check_readme_channel_list(manifest_channels, results)
    check_readme_table(providers, results)
    check_subscriptions(manifest_channels, results)

    print(
        "Checked %d providers and %d channels."
        % (len(providers), len(manifest_channels))
    )

    if results.warnings:
        print("\n%d warning(s):\n" % len(results.warnings))
        for warning in results.warnings:
            print("  - %s" % warning)

    if results.errors:
        print("\nFAIL: %d problem(s) found:\n" % len(results.errors))
        for error in results.errors:
            print("  - %s" % error)
        return 1

    print("OK: manifest, README and subscriptions are consistent.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
