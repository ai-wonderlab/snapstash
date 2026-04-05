#!/bin/bash
#
# snapstash uninstaller
# Removes shortcuts. Keeps your screenshots.
#

set -e

SERVICES_DIR="$HOME/Library/Services"

if [ -t 1 ]; then
  BOLD="\033[1m"
  DIM="\033[2m"
  GREEN="\033[32m"
  RESET="\033[0m"
else
  BOLD="" DIM="" GREEN="" RESET=""
fi

echo ""
echo -e "${BOLD}snapstash${RESET} — uninstall"
echo ""

# Remove workflows
rm -rf "$SERVICES_DIR/ScreenshotFull.workflow"
rm -rf "$SERVICES_DIR/ScreenshotArea.workflow"
echo -e "  ${GREEN}✓${RESET} Removed shortcuts"

# Refresh services
/System/Library/CoreServices/pbs -flush 2>/dev/null || true
echo -e "  ${GREEN}✓${RESET} Cleaned up"

echo ""
echo -e "  ${DIM}Your ~/Desktop/screenshots/ folder was not touched.${RESET}"
echo -e "  ${DIM}Your files are yours.${RESET}"
echo ""
