#!/usr/bin/env bash
set -euo pipefail

# zsh
chsh -s "$(which zsh)"

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  "$HOME/.oh-my-zsh/tools/upgrade.sh"
fi

# Claude Code
curl -fsSL https://claude.ai/install.sh | bash
