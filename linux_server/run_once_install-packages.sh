#!/bin/sh

# Request sudo permission at the beginning
sudo -v


# TODO warning if .desktop_or_server not exist

for file in ~/.{path,exports,aliases,functions,evals,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;





if [ -f "$HOME/.tmux/tmux.conf" ]; then
  ln -s -f .tmux/.tmux.conf
fi

if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"

fi


# install brew
if ! command -v brew >/dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

sudo apt-get update && sudo apt-get install $(grep -v '^#' .pkg | tr '\n' ' ')
