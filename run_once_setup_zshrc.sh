#!/bin/bash
# Run once: set up ~/.zshrc to source the common config if not already done.
# Safe to re-run: only appends if the source line is missing.

ZSHRC="$HOME/.zshrc"
SOURCE_LINE='[ -f "$HOME/.zshrc.common" ] && source "$HOME/.zshrc.common"'

if ! grep -qF '.zshrc.common' "$ZSHRC" 2>/dev/null; then
  echo "" >> "$ZSHRC"
  echo "# Load common config managed by chezmoi" >> "$ZSHRC"
  echo "$SOURCE_LINE" >> "$ZSHRC"
  echo "Added .zshrc.common source line to $ZSHRC"
else
  echo ".zshrc.common already referenced in $ZSHRC, skipping"
fi
