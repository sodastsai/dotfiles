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

# copying dotfiles
dotfiles=(
  .zshrc
  .editorconfig
  .devcontainer/*
)
for pattern in "${dotfiles[@]}"; do
  for file in "$DOTFILES_ROOT"/$pattern; do
    rel="${file#"$DOTFILES_ROOT/"}"
    mkdir -p "$HOME/$(dirname "$rel")"
    cp "$file" "$HOME/$rel"
  done
done

# Claude setup
mkdir -p "$HOME/.claude"
cp "$DOTFILES_ROOT/CLAUDE.common.md" "$HOME/.claude/CLAUDE.md"
curl -fsSL https://claude.ai/install.sh | bash
