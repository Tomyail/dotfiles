#!/bin/sh
# install brew
if ! command -v brew >/dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew bundle --global -v
