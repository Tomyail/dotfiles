#!/bin/bash
# Run once: pull SSH private keys from Bitwarden and write to ~/.ssh/
# Skipped entirely if bw is not available.

set -e

if ! command -v bw &>/dev/null; then
  echo "bw not found, skipping SSH key setup"
  exit 0
fi

if [ -n "$BW_SESSION" ]; then
  BW_CMD="bw --session $BW_SESSION"
elif bw status | grep -q '"status":"unlocked"'; then
  BW_CMD="bw"
else
  echo "Bitwarden is locked or not logged in, skipping SSH key setup"
  exit 0
fi

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

write_key() {
  local path="$1"
  local note_id="$2"
  local tmp

  tmp="$(mktemp "${path}.tmp.XXXXXX")"
  # Stream directly from bw to avoid mangling multiline content in shell variables.
  if ! {
    $BW_CMD get notes "$note_id" | tr -d '\r'
    printf '\n'
  } > "$tmp"; then
    rm -f "$tmp"
    echo "Warning: failed to fetch content for $path, skipping"
    return
  fi

  if [ ! -s "$tmp" ]; then
    rm -f "$tmp"
    echo "Warning: empty content for $path, skipping"
    return
  fi

  if ! ssh-keygen -l -f "$tmp" >/dev/null 2>&1; then
    rm -f "$tmp"
    echo "Warning: invalid SSH key content for $path, skipping"
    return
  fi

  chmod 600 "$tmp"
  mv "$tmp" "$path"
  echo "Written $path"
}

write_key "$HOME/.ssh/id_rsa" "c3d7b007-f796-4b2e-8706-16c4abc9d788"
write_key "$HOME/.ssh/pi"     "70067411-cea0-484b-b42a-ea3a7d463643"
