# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A [chezmoi](https://chezmoi.io) dotfiles repo. Files here are the *source*, not the live configs — chezmoi renders templates and writes the result to `$HOME`.

## Common commands

```bash
chezmoi diff              # Preview what would change in $HOME
chezmoi apply             # Apply source → $HOME
chezmoi update            # git pull + apply
chezmoi edit ~/.zshrc     # Edit a managed file (opens source)
chezmoi add ~/.config/foo # Start tracking a new file
chezmoi doctor            # Diagnose issues
```

Common aliases live in `dot_zshrc.common`, including `ccd` (chezmoi cd) and `cup` (chezmoi update). Machine-specific aliases can stay in unmanaged `~/.aliases`, which is sourced afterward so it can override shared aliases.

## Template conventions

Files ending in `.tmpl` are Go templates rendered by chezmoi. Key variables:

- `{{ .chezmoi.os }}` — `"darwin"` or `"linux"`
- OS-conditional blocks follow this pattern:
  ```
  {{- if eq .chezmoi.os "darwin" -}}
  ...mac-only content...
  {{- else if eq .chezmoi.os "linux" -}}
  ...linux-only content...
  {{- end -}}
  ```

## Script execution model

Chezmoi runs scripts based on filename prefix — order matters:

| Prefix | When it runs |
|--------|-------------|
| `run_once_*` | Once per machine (tracked by content hash) |
| `run_onchange_*` | When the file content (or a watched hash) changes |

Key scripts:
- `run_once_install_apt_packages.sh.tmpl` — apt bootstrap (Linux only, via `eq .chezmoi.os "linux"`)
- `run_once_install_linuxbrew.sh.tmpl` — Homebrew install (Linux only)
- `run_once_setup_env_file.sh` — pulls `~/.env` from Bitwarden (skipped if `bw` not available)
- `run_once_setup_ssh_keys.sh` — pulls SSH private keys from Bitwarden
- `run_once_setup_zshrc.sh` — appends `source ~/.zshrc.common` to `~/.zshrc` if missing
- `run_onchange_after_brew_bundle.sh.tmpl` — re-runs `brew bundle --global` when `dot_Brewfile.tmpl` changes (tracked via sha256 in comment)

## Shell config loading chain

```
~/.zshrc  (unmanaged, written by run_once_setup_zshrc.sh)
  └── ~/.zshrc.common  (managed: dot_zshrc.common)
        ├── ~/.path, ~/.exports, ~/.functions, ~/.aliases, ~/.extra  (sourced if present)
        ├── shared aliases defined directly in `dot_zshrc.common`
        └── tool inits: zoxide, atuin, direnv, orbstack (macOS)
```

`~/.extra` is intentionally unmanaged — use it for machine-specific overrides not tracked in git.

## OS-conditional file exclusions

`.chezmoiignore` uses templates to skip platform-specific files:

- **Linux**: ignores `.skhdrc`, `.yabairc`, `.config/alacritty`, `.config/kitty`, `.config/wezterm`
- **macOS**: ignores `.dir_colors`, `.pkg`

`.chezmoiexternal.toml.tmpl` similarly wraps macOS-only external downloads (Rime, dracula themes, alacritty themes) in `{{ if eq .chezmoi.os "darwin" }}`.

## Secrets via Bitwarden

`~/.env` and `~/.ssh/id_rsa` are not in the repo. They are fetched from Bitwarden by `run_once_*` scripts using the `bw` CLI. Scripts gracefully skip if `bw` is unavailable or locked. The `BW_SESSION` env var is used for non-interactive auth.

## Brewfile structure

`dot_Brewfile.tmpl` has separate sections for `darwin` and `linux` — the Linux section is a smaller subset.
