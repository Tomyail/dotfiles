#!/bin/bash
# Run once: pull .env file from Bitwarden and write to ~/.env
# Skipped entirely if bw is not available.

set -e

if ! command -v bw &>/dev/null; then
  echo "bw not found, skipping .env file setup"
  exit 0
fi

# Always sync Bitwarden first
echo "Syncing Bitwarden..."
if [ -n "$BW_SESSION" ]; then
  bw sync --session "$BW_SESSION" &>/dev/null || echo "Warning: bw sync failed, continuing..."
else
  bw sync &>/dev/null || echo "Warning: bw sync failed, continuing..."
fi

# Set up bw command based on BW_SESSION environment variable
if [ -n "$BW_SESSION" ]; then
  BW_CMD="bw --session $BW_SESSION"
  echo "BW_SESSION found, using authenticated session"
else
  BW_CMD="bw"
  # Check Bitwarden status if no BW_SESSION
  if ! bw status | grep -q '"status":"unlocked"'; then
    echo "Bitwarden is locked or not logged in, skipping .env file setup"
    exit 0
  fi
fi

# Check for jq dependency for JSON parsing
if ! command -v jq &>/dev/null; then
  echo "jq not found, cannot parse Bitwarden items, skipping .env file setup"
  exit 0
fi

TARGET_FILE="$HOME/.env"
tmp="$(mktemp "${TARGET_FILE}.tmp.XXXXXX")"

# Get BW_SESSION from Bitwarden item
BW_SESSION_ITEM_ID="4d7b3a15-d317-49cd-af20-b2651b96d1e7"

if BW_SESSION_VALUE=$($BW_CMD get password "$BW_SESSION_ITEM_ID" 2>/dev/null); then
  echo "export BW_SESSION=\"$BW_SESSION_VALUE\"" > "$tmp"
else
  rm -f "$tmp"
  echo "Warning: failed to fetch BW_SESSION from Bitwarden item $BW_SESSION_ITEM_ID, skipping"
  exit 0
fi

if [ ! -s "$tmp" ]; then
  rm -f "$tmp"
  echo "Warning: empty content for $TARGET_FILE, skipping"
  exit 0
fi

# Get GLM credentials from Bitwarden
GLM_ITEM_ID="36facff7-1e5a-41e6-8f3f-1622e2c1c4e5"

if GLM_JSON=$($BW_CMD get item "$GLM_ITEM_ID" 2>/dev/null); then
  GLM_BASE_URL=$(echo "$GLM_JSON" | jq -r '.login.username // empty')
  GLM_AUTH_TOKEN=$(echo "$GLM_JSON" | jq -r '.login.password // empty')

  if [ -n "$GLM_BASE_URL" ] && [ -n "$GLM_AUTH_TOKEN" ]; then
    {
      echo "export ANTHROPIC_AUTH_TOKEN=\"$GLM_AUTH_TOKEN\""
      echo "export ANTHROPIC_BASE_URL=\"$GLM_BASE_URL\""
    } >> "$tmp"
    echo "Added GLM credentials to $TARGET_FILE"
  else
    echo "Warning: GLM credentials not found or incomplete"
  fi
else
  echo "Warning: failed to fetch GLM item, skipping GLM credentials"
fi

chmod 600 "$tmp"
mv "$tmp" "$TARGET_FILE"
echo "Written $TARGET_FILE"
