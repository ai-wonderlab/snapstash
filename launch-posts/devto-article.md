---
title: How 3 Lines of Shell Replace a Missing macOS Feature
published: false
tags: macos, productivity, opensource, shell
---

# How 3 Lines of Shell Replace a Missing macOS Feature

## The problem

Every developer I know takes screenshots constantly. Progress updates. Bug reports. UI reviews. Quick shares in Slack.

On macOS, every screenshot is a choice:

- `⌘⇧3` → saves to a file
- `⌘⌃⇧3` → copies to clipboard

You can't have both. You pick one, then deal with the consequences. Need to paste it? Should've used clipboard. Need to find it later? Should've saved the file.

This isn't a big problem. It's a small one. But small problems that happen 20 times a day become big ones.

## The fix

Three lines of shell:

```bash
FILENAME="$HOME/Desktop/screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png"
screencapture -x "$FILENAME"
osascript -e "set the clipboard to (read (POSIX file \"$FILENAME\") as «class PNGf»)"
```

Line 1: Generate a filename with a timestamp.
Line 2: Take the screenshot and save it.
Line 3: Copy the saved image to clipboard.

That's the entire tool. No framework. No dependency. No build step.

## How it works

These three lines are wrapped in macOS Automator Quick Actions — the native way to create system-wide keyboard shortcuts. Two shortcuts:

| Shortcut | What it does |
|----------|-------------|
| `⌘⌥S` | Full screen → clipboard + `~/Desktop/screenshots/` |
| `⌘⌥A` | Select area → clipboard + `~/Desktop/screenshots/` |

After pressing the shortcut:
- `⌘V` pastes the screenshot anywhere
- The file is already saved with a timestamp

No background process. No menu bar icon. No app running.

## Install in 10 seconds

```bash
curl -sL https://raw.githubusercontent.com/ai-wonderlab/snapstash/main/install.sh | bash
```

The installer creates the screenshots folder, installs the Automator workflows, and registers the keyboard shortcuts. Clean output, no noise.

## Uninstall in 5 seconds

```bash
curl -sL https://raw.githubusercontent.com/ai-wonderlab/snapstash/main/uninstall.sh | bash
```

Removes the shortcuts. Keeps your screenshots. Your files are yours.

## Why this matters

There's something satisfying about solving a real problem with zero complexity. No `node_modules`. No `requirements.txt`. No Docker. No config file.

Just the operating system doing what it should have done in the first place.

The best tools don't ask you to change your workflow. They disappear into it.

## The repo

[github.com/ai-wonderlab/snapstash](https://github.com/ai-wonderlab/snapstash)

MIT license. macOS only. Zero dependencies.

*Snap it. Stash it. Paste it.*
