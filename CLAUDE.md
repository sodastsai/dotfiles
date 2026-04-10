# Dotfiles

## Overview
Personal dotfiles for macOS and GitHub Codespaces environments.
Symlinks managed by `link.sh`, tool setup bootstrapped by `install.sh`.

## Structure
- `zsh/` — zsh config
- `claude/` — Claude Code global config
- `git/` — global git config
- `ide/` — common IDE setup
- `devenv/` — dev environment setup (containers, codespaces)
- `install.sh` — bootstrap script
- `link.sh` — symlinks dotfiles into place

## Key Rules
- All `*.sh` scripts must be idempotent
- Symlink, don't copy — edits in the repo reflect immediately
- macOS and Codespaces (Ubuntu) are both supported
- Never commit secrets — use env var references

## Out of Scope
- No package installation (Homebrew, apt)
- No SSH key management
