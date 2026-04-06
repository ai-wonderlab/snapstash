# Reddit r/macapps

## Title
I got tired of choosing between clipboard and file for screenshots. Built a 3-line fix.

## Body
[GIF: assets/demo.gif]

Every time I take a screenshot on macOS, I have to decide: save it to a file (⌘⇧3) or copy it to clipboard (⌘⌃⇧3). Never both.

I take 20+ screenshots a day — sharing progress, debugging, documenting. I always need both: paste it in Slack AND have it saved.

So I built **snapstash** — two keyboard shortcuts that do both at once:

- `⌘⌥S` → full screen → clipboard + `~/Desktop/screenshots/`
- `⌘⌥A` → select area → clipboard + `~/Desktop/screenshots/`

One-line install:
```
curl -sL https://raw.githubusercontent.com/ai-wonderlab/snapstash/main/install.sh | bash
```

Zero dependencies. Pure macOS native (Automator Quick Actions + 3 lines of shell). No app to run, no menu bar icon, nothing in the background.

GitHub: https://github.com/ai-wonderlab/snapstash

MIT license. Takes 10 seconds to install, 5 seconds to uninstall.
