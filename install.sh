#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(dirname "$0")"

# zsh setup
chsh -s $(which zsh)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  "$HOME/.oh-my-zsh/tools/upgrade.sh"
fi

cp "$DOTFILES_ROOT/.zshrc" "$HOME/.zshrc"

# Claude code
curl -fsSL https://claude.ai/install.sh | bash
