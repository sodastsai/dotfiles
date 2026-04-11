#!/usr/bin/env bash
set -euo pipefail

# Claude Persistence
sudo chown -R codespace:codespace /home/codespace/.claude

# oh-my-zsh update
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  "$HOME/.oh-my-zsh/tools/upgrade.sh"
fi
