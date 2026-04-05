# Hacker News

## Title (submit as URL pointing to GitHub repo)
Show HN: snapstash – Screenshot to clipboard and folder in one shortcut (macOS)

## URL
https://github.com/ai-wonderlab/snapstash

## First Comment (post within 5 minutes of submission)

Hey HN — I built this because of a small daily friction that added up.

I take a lot of screenshots while coding — sharing progress, documenting bugs, saving UI states. Every time, macOS makes me choose: clipboard (⌘⌃⇧3) or file (⌘⇧3). I always need both.

snapstash adds two shortcuts: Ctrl+Shift+S (full screen) and Ctrl+Shift+A (area select). Both save to ~/Desktop/screenshots/ AND copy to clipboard. Simultaneously.

The whole thing is 3 lines of shell wrapped in Automator Quick Actions:

    screencapture -x "$FILENAME"
    osascript -e "set the clipboard to (read (POSIX file \"$FILENAME\") as «class PNGf»)"

No dependencies. No background process. No app. Pure macOS native.

One curl to install, one curl to uninstall. MIT licensed.

Happy to hear if this is useful or if there's something I'm missing about macOS that already does this.

---

## ENGAGEMENT NOTES:
- Respond to every comment within minutes
- If someone says "you can already do this with X" → genuinely curious, ask how
- If someone suggests improvements → "great idea, opening an issue"
- If criticism → "fair point" + honest response
- Never defensive. Always conversational.
