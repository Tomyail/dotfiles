tap "homebrew/bundle"
tap "homebrew/cask", "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git"
tap "homebrew/cask-fonts", "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git"
tap "homebrew/core", "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
tap "homebrew/services"
tap 'homebrew/cask-drivers'
tap "homebrew/cask-versions"
# font


##
# Terminals
#
# We typically use `tmux`, `tmate`,
# and sometimes fall back on `screen`.
##

# iTerm is our favorite terminal app.
cask 'iterm2'

# Tmux is a newer terminal multiplexer.
brew 'pkg-config', link: true
brew 'tmux'
brew 'reattach-to-user-namespace'

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



# Install `wget` with IRI support.
brew  'wget', args: ['with-iri']

# Install GnuPG to enable PGP-signing commits.
brew  'gnupg'

# Install more recent versions of some macOS tools.
brew  'vim', args: ['with-override-system-vi']
brew  'grep'
brew  'openssh'


# 各种小工具

# 磁盘空间查看工具

brew 'ncdu'
