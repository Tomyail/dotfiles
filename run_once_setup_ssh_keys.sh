#!/bin/bash
# Run once: pull SSH private keys from Bitwarden and write to ~/.ssh/
# Skipped entirely if bw is not available.

set -e

if ! command -v bw &>/dev/null; then
  echo "bw not found, skipping SSH key setup"
  exit 0
fi

if ! bw status | grep -q '"status":"unlocked"'; then
  echo "Bitwarden is locked or not logged in, skipping SSH key setup"
  exit 0
fi

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

write_key() {
  local path="$1"
  local content="$2"
  if [ -z "$content" ]; then
    echo "Warning: empty content for $path, skipping"
    return
  fi
  printf '%s' "$content" > "$path"
  chmod 600 "$path"
  echo "Written $path"
}

write_key "$HOME/.ssh/id_rsa" "$(bw get notes c3d7b007-f796-4b2e-8706-16c4abc9d788)"
write_key "$HOME/.ssh/pi"     "$(bw get notes 70067411-cea0-484b-b42a-ea3a7d463643)"
