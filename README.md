# dotfiles

My dotfiles for macOS and Linux (Ubuntu server / WSL), managed by [chezmoi](https://chezmoi.io).

Linux uses `apt` for the system baseline and Homebrew for developer tooling. On Linux, the scene is set automatically — no selection needed. WSL-specific integrations (`wslview`, `clip.exe`) are detected at runtime.

## What's included

### Core Tools

| Tool | Description | macOS | Linux |
|------|-------------|:-----:|:-----:|
| Homebrew | Package manager | ✅ | ✅ |
| Git | Version control | ✅ | ✅ |
| mise | Multi-language version manager | ✅ | ✅ |

### Shell

| Tool | Description | macOS | Linux |
|------|-------------|:-----:|:-----:|
| Zsh | Shell | ✅ | ✅ |
| Oh My Zsh | Zsh framework | ✅ | ✅ |
| Powerlevel10k | Shell theme | ✅ | ✅ |
| zsh-syntax-highlighting | Syntax highlighting | ✅ | ✅ |
| zsh-autosuggestions | Autosuggestions | ✅ | ✅ |
| atuin | Shell history | ✅ | ✅ |
| zoxide | Smart directory jumper | ✅ | ✅ |

### Terminal & Editor

| Tool | Description | macOS | Linux |
|------|-------------|:-----:|:-----:|
| Tmux | Terminal multiplexer | ✅ | ✅ |
| Neovim | Editor | ✅ | ✅ |
| Alacritty | GPU-accelerated terminal | ✅ | ❌ |
| WezTerm | GPU-accelerated terminal | ✅ | ❌ |
| Kitty | Terminal emulator | ✅ | ❌ |

### Development Tools

| Tool | Description | macOS | Linux |
|------|-------------|:-----:|:-----:|
| LazyGit | Git TUI | ✅ | ✅ |
| fzf | Fuzzy finder | ✅ | ✅ |
| ripgrep | Fast search | ✅ | ✅ |
| fd | Fast file finder | ✅ | ✅ |
| bat | Better cat | ✅ | ✅ |
| eza | Better ls | ✅ | ✅ |

### macOS Only

| Tool | Description |
|------|-------------|
| Yabai | Window manager |
| skhd | Hotkey daemon |

## Project Structure

```
.
├── .chezmoi.toml.tmpl              # Chezmoi config template
├── .chezmoiexternal.toml           # External dependencies (oh-my-zsh, tmux, nvim)
├── .chezmoiignore                  # Ignored files
├── dot_Brewfile.tmpl               # Homebrew packages
├── dot_aliases                     # Shell aliases
├── dot_functions                   # Shell functions
├── dot_gitconfig.tmpl              # Git global config
├── dot_gitconfig_personal          # Git personal identity
├── dot_p10k.zsh                    # Powerlevel10k theme config
├── dot_prettierrc                  # Prettier config
├── dot_skhdrc                      # skhd hotkey config (macOS)
├── dot_tmux.conf.local             # Tmux config
├── dot_zshrc.common                # Shared zsh config (sourced by ~/.zshrc)
├── executable_dot_yabairc          # Yabai window manager config (macOS)
├── private_dot_ssh/                # SSH config (private)
├── dot_config/
│   ├── alacritty/                  # Alacritty terminal config
│   ├── atuin/                      # Atuin shell history config
│   ├── kitty/                      # Kitty terminal config
│   ├── mise/                       # mise version manager config
│   ├── opencode/                   # OpenCode AI editor config
│   └── wezterm/                    # WezTerm terminal config
├── run_once_install_apt_packages.sh.tmpl  # Install base apt packages (Linux/WSL)
├── run_once_install_linuxbrew.sh.tmpl     # Install Homebrew on Linux/WSL
├── run_once_setup_env_file.sh      # Pull .env from Bitwarden
├── run_once_setup_ssh_keys.sh      # Set up SSH keys
├── run_once_setup_zshrc.sh         # Wire ~/.zshrc to source .zshrc.common
├── run_onchange_after_brew_bundle.sh.tmpl # Re-run brew bundle on Brewfile changes
└── run_onchange_after_source.sh    # Re-source shell on config changes
```

## Installation

```sh
curl -fsSL https://raw.githubusercontent.com/tomyail/dotfiles/main/install.sh -o /tmp/install.sh
bash /tmp/install.sh
```

> **Note:** Download first, then run — the script has interactive steps (Bitwarden login/unlock) that require a real terminal and won't work via `curl | bash`.

The script handles everything in order:
1. macOS: installs Xcode Command Line Tools if missing
2. macOS/Linux: installs Homebrew if missing
3. Linux: installs base apt packages (`curl`, `git`, `zsh`, …) before Homebrew
4. Installs Bitwarden CLI via `brew install bitwarden-cli`, then guides you through login/unlock
5. Installs chezmoi if missing
6. Prompts for scene (`mac_home` / `mac_office`) on macOS; auto-sets `linux` on Linux
7. Runs `chezmoi init --apply tomyail`
8. Sets zsh as the default shell

**Non-interactive / CI:**
```sh
export CHEZMOI_SCENE=mac_home   # skip the scene prompt
export BW_SESSION=<token>       # skip the Bitwarden unlock prompt
bash /tmp/install.sh
```

## Linux Details

### What gets installed

`run_once_install_apt_packages.sh.tmpl` installs the base packages:

```
ca-certificates curl file git procps sudo wget zsh unzip build-essential
```

On WSL (detected via `/proc/sys/kernel/osrelease`), `wslu` is also installed for `wslview`.

`run_once_install_linuxbrew.sh.tmpl` then installs Homebrew, and `dot_Brewfile.tmpl` manages developer tools.

### Expected state after apply

- `~/.zshrc` sources `~/.zshrc.common`
- `tmux`, oh-my-zsh, and `~/.config/nvim` are pulled from `.chezmoiexternal.toml`
- On WSL: `open → wslview` and `pbcopy → clip.exe` are aliased automatically if available

### Quick checks

```bash
chezmoi doctor
chezmoi managed | rg 'zshrc|tmux|nvim'
zsh --version && tmux -V && nvim --version
```

## Chezmoi Maintenance

### Daily workflow

```bash
chezmoi diff              # See pending changes
chezmoi edit ~/.zshrc     # Edit a managed file
chezmoi add ~/.config/nvim/init.lua  # Track a new file
chezmoi apply             # Apply all changes
chezmoi update -v         # Pull from remote and apply
```

### Useful commands

```bash
chezmoi unmanaged         # List untracked files
chezmoi doctor            # Check for issues
chezmoi managed           # List all managed files
chezmoi execute-template '{{ .chezmoi.os }} / {{ .scene }}'  # Check current scene
```

### Sync to a new machine

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --purge tomyail
```

## Inspiration

- https://safjan.com/top-popular-zsh-plugins-on-github-2023/
