#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"

log()  { echo "[install] $*"; }
fail() { echo "[install] ERROR: $*"; }

symlink() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if ln -sf "$src" "$dst"; then
    log "linked $dst -> $src"
  else
    fail "failed to link $dst -> $src"
    return 1
  fi
}

copy_file() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if cp -f "$src" "$dst"; then
    log "copied $dst <- $src"
  else
    fail "failed to copy $dst <- $src"
    return 1
  fi
}

# zsh
log "--- zsh ---"
for f in "$DOTFILES_ROOT"/zsh/.*; do
  name="$(basename "$f")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".gitkeep" ]] && continue
  symlink "$f" "$HOME/$name"
done

# git
# git v2.32+ does not follow symlinks for files it reads directly (.gitignore,
# .gitattributes, etc.), so copy everything in git/ instead of symlinking
log "--- git ---"
for f in "$DOTFILES_ROOT"/git/.*; do
  name="$(basename "$f")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".gitkeep" ]] && continue
  copy_file "$f" "$HOME/$name"
done

# ide
log "--- ide ---"
for f in "$DOTFILES_ROOT"/ide/.*; do
  name="$(basename "$f")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".gitkeep" ]] && continue
  symlink "$f" "$HOME/$name"
done

# claude
log "--- claude ---"
symlink "$DOTFILES_ROOT/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
for name in settings.json rules commands agents skills; do
  src="$DOTFILES_ROOT/claude/$name"
  [ -e "$src" ] && symlink "$src" "$HOME/.claude/$name"
done

log "--- done ---"
