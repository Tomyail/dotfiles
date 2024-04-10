# dotfiles

my dotfiles for macos(working), ubuntu desktop(personal project) and ubuntu server(cloud and home server).

dot files are separated by desktop and server.

desktop for daily use and server for cloud and home server.

## what's included

|                                                                               | macos(with brew) | linux(desktop with brew) | linux(server with brew) | linux(server without brew) |
| ----------------------------------------------------------------------------- | ---------------- | ------------------------ | ----------------------- | -------------------------- |
| tmux                                                                          | ✅               | ✅                       | ✅                      | ✅                         |
| tpm                                                                           | ✅               | ✅                       | ✅                      | ✅                         |
| ohmytmux                                                                      | ✅               | ✅                       | ✅                      | ✅                         |
| [vimrc](https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim) | ✅               | ✅                       | ✅                      | ✅                         |
| nvim                                                                          | ✅               | ✅                       | ✅                      | ❌                         |
| nvim_config                                                                   | ✅               | ✅                       | ❌                      | ❌                         |
| dracula theme                                                                 | ✅               | ✅                       | ❌                      | ❌                         |
| lazygit                                                                       | ✅               | ✅                       | ✅                      | ❌                         |
| p10k                                                                          | ✅               | ✅                       | ✅                      | ❌                         |
| alacritty                                                                     | ✅               | ❌                       | ❌                      | ❌                         |
| IBMPlexMono Nerd Font                                                         | ✅               | ✅                       | ❌                      | ❌                         |
| asdf                                                                          | ✅               | ✅                       | ✅                      | ❌                         |
| zsh                                                                           | ✅               | ✅                       | ✅                      | ❌                         |
| ohmyzsh                                                                       | ✅               | ✅                       | ✅                      | ❌                         |
| zsh-syntax-highlighting                                                       | ✅               | ✅                       | ✅                      | ❌                         |
| zsh-autosuggestions                                                           | ✅               | ✅                       | ✅                      | ❌                         |

- brew: cross platform package manager
  - nvim config(desktop only): text editor
  - zsh: shell
    - oh-my-zsh
    - zsh-syntax-highlighting
    - zsh-autosuggestions
    - powerlevel10k
  - yabai and skhd(macos desktop only): window manager
  - tmux: terminal multiplexer( oh my tmux)
    - tpm The TPM bindings differ slightly from upstream:
      - installing plugins: `<prefix>` + I
      - uninstalling plugins: `<prefix>` + Alt + u
      - updating plugins: `<prefix>` + u
      - vim-tmux-navigator: window manager
  - lazygit
  - git: version control
  - rime: input
  - nerdFont: IBMBlexMono
- asdf: programming language version manager

## How to install

[using bitwarden cli to get the password](https://medium.com/@josemrivera/share-credentials-across-machines-using-chezmoi-and-bitwarden-4069dcb6e367)

```sh
xcode-select --install

# mac_home|mac_offie|linux_server|ubuntu_desktop
export CHEZMOI_SCENE=mac_home
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tomyail
```

chezmoi dir: `~/.config/chezmoi/chezmoi.toml`
zsh should be the default shell:

```bash
chsh -s $(which zsh)
```

## Inspiration

- https://safjan.com/top-popular-zsh-plugins-on-github-2023/
