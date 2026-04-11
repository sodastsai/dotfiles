#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"

symlink() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
}

# zsh
for f in "$DOTFILES_ROOT"/zsh/.*; do
  name="$(basename "$f")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".gitkeep" ]] && continue
  symlink "$f" "$HOME/$name"
done

# git
for f in "$DOTFILES_ROOT"/git/.*; do
  name="$(basename "$f")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".gitkeep" ]] && continue
  symlink "$f" "$HOME/$name"
done

# ide
for f in "$DOTFILES_ROOT"/ide/.*; do
  name="$(basename "$f")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".gitkeep" ]] && continue
  symlink "$f" "$HOME/$name"
done

# claude
symlink "$DOTFILES_ROOT/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
if [ -f "$DOTFILES_ROOT/claude/settings.json" ]; then
  symlink "$DOTFILES_ROOT/claude/settings.json" "$HOME/.claude/settings.json"
fi
