#!/bin/bash
#
# snapstash installer
# Screenshot → clipboard + folder. Both. Every time.
#

set -e

SCREENSHOTS_DIR="$HOME/Desktop/screenshots"
SERVICES_DIR="$HOME/Library/Services"
REPO_URL="https://raw.githubusercontent.com/ai-wonderlab/snapstash/main"

# --- Colors (if terminal supports them) ---
if [ -t 1 ]; then
  BOLD="\033[1m"
  DIM="\033[2m"
  GREEN="\033[32m"
  RESET="\033[0m"
else
  BOLD="" DIM="" GREEN="" RESET=""
fi

echo ""
echo -e "${BOLD}snapstash${RESET}"
echo -e "${DIM}Screenshot → clipboard + folder. Both. Every time.${RESET}"
echo ""

# --- Step 1: Screenshots folder ---
mkdir -p "$SCREENSHOTS_DIR"
echo -e "  ${GREEN}✓${RESET} Created ~/Desktop/screenshots/"

# --- Step 2: Download and install workflows ---
mkdir -p "$SERVICES_DIR"

# Full screen workflow
FULL_DIR="$SERVICES_DIR/ScreenshotFull.workflow/Contents"
mkdir -p "$FULL_DIR"
curl -sL "$REPO_URL/workflows/ScreenshotFull.workflow/Contents/document.wflow" -o "$FULL_DIR/document.wflow"
curl -sL "$REPO_URL/workflows/ScreenshotFull.workflow/Contents/Info.plist" -o "$FULL_DIR/Info.plist"
echo -e "  ${GREEN}✓${RESET} Installed full screen shortcut"

# Area selection workflow
AREA_DIR="$SERVICES_DIR/ScreenshotArea.workflow/Contents"
mkdir -p "$AREA_DIR"
curl -sL "$REPO_URL/workflows/ScreenshotArea.workflow/Contents/document.wflow" -o "$AREA_DIR/document.wflow"
curl -sL "$REPO_URL/workflows/ScreenshotArea.workflow/Contents/Info.plist" -o "$AREA_DIR/Info.plist"
echo -e "  ${GREEN}✓${RESET} Installed area selection shortcut"

# --- Step 3: Register keyboard shortcuts ---
defaults write pbs NSServicesStatus -dict-add \
  '"(null) - ScreenshotFull - runWorkflowAsService"' \
  '{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "@~s"; }'

defaults write pbs NSServicesStatus -dict-add \
  '"(null) - ScreenshotArea - runWorkflowAsService"' \
  '{ "enabled_context_menu" = 1; "enabled_services_menu" = 1; "key_equivalent" = "@~a"; }'

# Refresh services
/System/Library/CoreServices/pbs -flush 2>/dev/null || true

echo -e "  ${GREEN}✓${RESET} Keyboard shortcuts registered"

# --- Done ---
echo ""
echo -e "  ${BOLD}⌘⌥S${RESET}  full screen → clipboard + ~/Desktop/screenshots/"
echo -e "  ${BOLD}⌘⌥A${RESET}  select area → clipboard + ~/Desktop/screenshots/"
echo ""
echo -e "  ${DIM}First run: macOS will ask for Screen Recording permission.${RESET}"
echo -e "  ${DIM}Allow it once and you're set.${RESET}"
echo ""
echo -e "  ${BOLD}Snap it. Stash it. Paste it.${RESET}"
echo ""
