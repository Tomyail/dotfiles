#!/bin/sh

# Request sudo permission at the beginning
sudo -v


for file in ~/.{path,exports,aliases,functions,evals,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;




sudo apt-get install build-essential -y

	sudo apt-get install  ibus-rime -y
## restart ibus
## ibus-daemon -drx


if [ -f "$HOME/.tmux/tmux.conf" ]; then
  ln -s -f .tmux/.tmux.conf
fi

if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"

	if ! command -v node >/dev/null; then
		asdf plugin add nodejs
		asdf install nodejs latest:18
		asdf global nodejs latest:18
	fi
fi


# install brew
if ! command -v brew >/dev/null 2>&1; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew bundle --global -v
