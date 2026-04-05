# Reddit r/commandline

## Title
The entire tool is 3 lines of shell. Screenshots to clipboard AND folder on macOS.

## Body
macOS can screenshot to clipboard OR save to file. Not both. This annoyed me enough to fix it.

The core is literally this:

```bash
FILENAME="$HOME/Desktop/screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png"
screencapture -x "$FILENAME"
osascript -e "set the clipboard to (read (POSIX file \"$FILENAME\") as «class PNGf»)"
```

Wrapped it in Automator Quick Actions with keyboard shortcuts:
- `Ctrl+Shift+S` — full screen
- `Ctrl+Shift+A` — select area (interactive)

Both save to `~/Desktop/screenshots/` AND copy to clipboard. Every time.

One curl to install: `curl -sL https://raw.githubusercontent.com/ai-wonderlab/snapstash/main/install.sh | bash`

No brew, no npm, no python. Just macOS native tools.

https://github.com/ai-wonderlab/snapstash
