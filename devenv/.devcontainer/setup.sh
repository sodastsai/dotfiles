#!/usr/bin/env bash
set -euo pipefail

log()  { echo "[setup] $*"; }
fail() { echo "[setup] ERROR: $*" >&2; }

# Claude Persistence
log "--- claude persistence ---"
if sudo chown -R codespace:codespace /home/codespace/.claude; then
  log "chown /home/codespace/.claude OK"
else
  fail "chown /home/codespace/.claude failed"
  exit 1
fi

# oh-my-zsh update
log "--- oh-my-zsh ---"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  log "upgrading oh-my-zsh"
  "$HOME/.oh-my-zsh/tools/upgrade.sh"
fi

log "--- done ---"
