tap "homebrew/bundle"
tap "homebrew/cask", "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git"
tap "homebrew/cask-fonts", "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git"
tap "homebrew/core", "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
tap "homebrew/services"
tap 'homebrew/cask-drivers'
tap "homebrew/cask-versions"

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew "coreutils"

##
# Terminals
#
# We typically use `tmux`, `tmate`,
# and sometimes fall back on `screen`.
##

# Tmux is a newer terminal multiplexer.
brew 'pkg-config', link: true
brew 'tmux'

##
# Shells
#
# We typically use bash, zsh, fish, and mosh.
##

# Bash is the Bourne Again SHell. Bash is an sh-compatible shell.
brew 'bash'

# Programmable completion functions for bash
brew 'bash-completion'


# Zsh is a shell designed for interactive use.
brew 'zsh'





##
# Editors
#
# We typically use command line editors (vim, emacs, etc.)
# and sometimes use GUI editors (atom, sublime, etc.)
##



# Vim editor
brew 'vim'



##
# Version control
#
# We prefer `git` version control. We also work on a wide
# range of systems, so we also sometimes use CVS, HG, and SVN.
##


# Git is a free and open source distributed version control system.
brew 'git'

# Git Large File Storage
brew 'git-lfs'



# Install GnuPG to enable PGP-signing commits.
brew  'gnupg'

brew  'grep'
brew  'openssh'


# 各种小工具

# 磁盘空间查看工具

brew 'ncdu'


# 安装 ruby
brew 'ruby'
