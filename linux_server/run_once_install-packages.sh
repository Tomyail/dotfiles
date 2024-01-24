#!/bin/sh

# Request sudo permission at the beginning
sudo -v


for file in ~/.{path,exports,aliases,functions,evals,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -f "$HOME/.tmux/tmux.conf" ]; then
  ln -s -f .tmux/.tmux.conf
fi

sudo apt-get update && sudo apt-get install $(grep -v '^#' .pkg | tr '\n' ' ')
