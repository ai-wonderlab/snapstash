# Contributing to snapstash

## What matters

snapstash does one thing. It does it well. That's the point.

If you want to contribute, here's what we care about:

**Keep it simple.** No dependencies. No build steps. No complexity for complexity's sake. If a change makes the install take longer or the code harder to read, it's probably not the right change.

**Keep it native.** This runs on macOS with zero external tools. That's a feature, not a limitation.

**Keep it human.** Code should read like someone wrote it for another person, not for a compiler. Comments explain *why*, not *what*.

## How to contribute

1. Fork it
2. Change it
3. Test it on your Mac — does `install.sh` still work from a clean state?
4. Open a PR and tell us what you changed and why

## Ideas we'd love

- Support for more macOS versions
- Better screen recording permission handling
- Configurable shortcut keys
- Localization (the install output, not the code)

## Ideas we'd skip

- Adding dependencies
- Cross-platform support (this is a macOS-native tool — that's its soul)
- Feature bloat — if it needs a settings panel, it's too much
