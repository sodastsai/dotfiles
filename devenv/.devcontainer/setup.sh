#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")/.." && pwd)"


# Claude persistence
# If volume is empty (first time), seed it from feature-prepared ~/.claude
if [ -z "$(ls -A /claude 2>/dev/null)" ]; then
  rsync -a ~/.claude/ /claude/
fi
# Replace ~/.claude with symlink to persistent volume
rm -rf ~/.claude
ln -s /claude ~/.claude


# oh-my-zsh update
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  "$HOME/.oh-my-zsh/tools/upgrade.sh"
fi
