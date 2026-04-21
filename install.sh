#!/usr/bin/env bash
# Bootstrap script for tomyail/dotfiles
# Usage: curl -fsSL https://raw.githubusercontent.com/tomyail/dotfiles/main/install.sh | bash
# Or:    bash install.sh [--scene mac_home|mac_office]

set -euo pipefail

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()    { echo -e "${BOLD}==> $*${NC}"; }
success() { echo -e "${GREEN}✓ $*${NC}"; }
warn()    { echo -e "${YELLOW}⚠ $*${NC}"; }
die()     { echo -e "${RED}✗ $*${NC}" >&2; exit 1; }

have() { command -v "$1" &>/dev/null; }

OS="$(uname -s)"

# ---------------------------------------------------------------------------
# Parse args
# ---------------------------------------------------------------------------
SCENE="${CHEZMOI_SCENE:-}"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --scene) SCENE="$2"; shift 2 ;;
    *) die "Unknown argument: $1" ;;
  esac
done

# ---------------------------------------------------------------------------
# Step 1: macOS pre-requisites
# ---------------------------------------------------------------------------
if [[ "$OS" == "Darwin" ]]; then
  info "Checking Xcode Command Line Tools..."
  if ! xcode-select -p &>/dev/null; then
    info "Installing Xcode Command Line Tools (this may take a few minutes)..."
    xcode-select --install
    echo "Waiting for Xcode CLT installation to complete..."
    until xcode-select -p &>/dev/null; do sleep 5; done
    success "Xcode Command Line Tools installed"
  else
    success "Xcode Command Line Tools already installed"
  fi
fi

# ---------------------------------------------------------------------------
# Step 2: macOS — install Homebrew if missing
# ---------------------------------------------------------------------------
if [[ "$OS" == "Darwin" ]]; then
  if ! have brew; then
    info "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH for Apple Silicon
    if [[ -f /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    success "Homebrew installed: $(brew --version | head -1)"
  else
    success "Homebrew already installed"
  fi
fi

# ---------------------------------------------------------------------------
# Step 3: Linux pre-requisites (apt) + Homebrew
# ---------------------------------------------------------------------------
if [[ "$OS" == "Linux" ]]; then
  if have apt-get; then
    info "Installing base apt packages..."
    SUDO=""
    if [[ "$(id -u)" -ne 0 ]]; then
      have sudo || die "sudo is required"
      SUDO="sudo"
    fi
    pkgs=(ca-certificates curl file git procps wget zsh unzip build-essential)
    if grep -qi microsoft /proc/sys/kernel/osrelease 2>/dev/null; then
      pkgs+=(wslu)
    fi
    $SUDO apt-get update -q
    $SUDO apt-get install -y -q "${pkgs[@]}"
    success "apt packages installed"
  fi

  if ! have brew; then
    info "Installing Homebrew on Linux..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add brew to PATH (Linux default location)
    if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [[ -f "$HOME/.linuxbrew/bin/brew" ]]; then
      eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
    fi
    success "Homebrew installed: $(brew --version | head -1)"
  else
    success "Homebrew already installed"
  fi
fi

# ---------------------------------------------------------------------------
# Step 4: Install Bitwarden CLI via Homebrew
# ---------------------------------------------------------------------------
install_bw() {
  info "Installing Bitwarden CLI..."
  brew install bitwarden-cli
  success "Bitwarden CLI installed: $(bw --version)"
}

if ! have bw; then
  install_bw
fi

# ---------------------------------------------------------------------------
# Step 4: Bitwarden login & unlock → export BW_SESSION
# ---------------------------------------------------------------------------
setup_bw_session() {
  if [[ -n "${BW_SESSION:-}" ]]; then
    if bw --session "$BW_SESSION" status 2>/dev/null | grep -q '"status":"unlocked"'; then
      success "BW_SESSION already valid"
      return
    else
      warn "BW_SESSION is set but invalid/expired, re-authenticating..."
      unset BW_SESSION
    fi
  fi

  if ! have bw; then
    warn "bw not found — skipping Bitwarden setup (secrets will not be fetched)"
    return
  fi

  # Ensure stdin is a terminal; if not (e.g. curl|bash), skip interactive steps
  if ! [[ -t 0 ]]; then
    warn "Non-interactive shell detected — skipping Bitwarden unlock (secrets will not be fetched)"
    warn "Re-run the script directly or set BW_SESSION before running"
    return
  fi

  local status
  status="$(bw status 2>/dev/null | grep -o '"status":"[^"]*"' | cut -d'"' -f4 || echo "unauthenticated")"

  if [[ "$status" == "unauthenticated" ]]; then
    info "Bitwarden: not logged in. Please log in:"
    if ! bw login; then
      warn "Bitwarden login failed — secrets will be skipped"
      return
    fi
    status="locked"
  fi

  if [[ "$status" == "locked" ]]; then
    info "Bitwarden: vault is locked. Please unlock:"
    if ! BW_SESSION="$(bw unlock --raw)"; then
      warn "Bitwarden unlock failed — secrets will be skipped"
      return
    fi
    export BW_SESSION
  fi

  if bw --session "${BW_SESSION:-}" status 2>/dev/null | grep -q '"status":"unlocked"'; then
    success "Bitwarden vault unlocked"
    echo ""
    echo "  To reuse this session in future runs:"
    echo "    export BW_SESSION=\"$BW_SESSION\""
    echo ""
  else
    warn "Could not unlock Bitwarden — secrets will be skipped"
    unset BW_SESSION
  fi
}

setup_bw_session

# ---------------------------------------------------------------------------
# Step 5: Install chezmoi (if needed)
# ---------------------------------------------------------------------------
info "Checking chezmoi..."
if ! have chezmoi; then
  info "Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
  success "chezmoi installed: $(chezmoi --version)"
else
  success "chezmoi already installed: $(chezmoi --version)"
fi

# ---------------------------------------------------------------------------
# Step 6: Determine scene (macOS only)
# ---------------------------------------------------------------------------
if [[ "$OS" == "Darwin" && -z "$SCENE" ]]; then
  echo ""
  echo "Select your scene:"
  echo "  1) mac_home"
  echo "  2) mac_office"
  read -r -p "Enter 1 or 2: " choice
  case "$choice" in
    1) SCENE="mac_home" ;;
    2) SCENE="mac_office" ;;
    *) die "Invalid choice: $choice" ;;
  esac
elif [[ "$OS" == "Linux" ]]; then
  SCENE="linux"
fi
export CHEZMOI_SCENE="$SCENE"
info "Scene: $SCENE"

# ---------------------------------------------------------------------------
# Step 7: Run chezmoi init --apply
# ---------------------------------------------------------------------------
info "Running chezmoi init --apply..."
chezmoi init --apply tomyail
success "chezmoi apply complete"

# ---------------------------------------------------------------------------
# Step 8: Set zsh as default shell
# ---------------------------------------------------------------------------
ZSH_PATH="$(which zsh 2>/dev/null || true)"
if [[ -z "$ZSH_PATH" ]]; then
  warn "zsh not found, skipping default shell change"
elif [[ "$SHELL" == "$ZSH_PATH" ]]; then
  success "zsh is already the default shell"
else
  info "Setting zsh as default shell ($ZSH_PATH)..."
  if ! grep -qF "$ZSH_PATH" /etc/shells 2>/dev/null; then
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
  fi
  chsh -s "$ZSH_PATH"
  success "Default shell changed to zsh (takes effect in next login)"
fi

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------
echo ""
echo -e "${GREEN}${BOLD}All done!${NC}"
echo ""
echo "Next steps:"
echo "  • Open a new terminal (or run: exec zsh) to load the new shell config"
if [[ "$OS" == "Darwin" ]]; then
  echo "  • Run 'brew bundle --global' if Homebrew packages need updating"
fi
echo "  • Run 'chezmoi doctor' to verify the setup"
echo ""
