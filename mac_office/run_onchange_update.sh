#!/bin/zsh
if ! command -v brew >/dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


ln -s -f "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"
brew bundle --global -v

source ~/.zshrc
