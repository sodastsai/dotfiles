#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"

# zsh
chsh -s "$(which zsh)"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  "$HOME/.oh-my-zsh/tools/upgrade.sh"
fi

# Claude CLI
curl -fsSL https://claude.ai/install.sh | bash

# symlink dotfiles
"$DOTFILES_ROOT/link.sh"
