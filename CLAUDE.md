# Dotfiles

## Overview
Personal dotfiles for macOS and GitHub Codespaces environments.
Symlinks managed by `install.sh`, tool setup bootstrapped by `.devcontainer/setup.sh`.

## Structure
- `zsh/` — zsh config
- `claude/` — Claude Code global config
- `git/` — global git config
- `ide/` — common IDE setup
- `devenv/` — dev environment setup (containers, codespaces)
- `install.sh` — symlinks dotfiles into place
- `.devcontainer/setup.sh` — Codespaces postCreateCommand: shell, oh-my-zsh, Claude Code

## Key Rules
- All `*.sh` scripts must be idempotent
- Symlink, don't copy — edits in the repo reflect immediately
- macOS and Codespaces (Ubuntu) are both supported
- Never commit secrets — use env var references

## Out of Scope
- No package installation (Homebrew, apt)
- No SSH key management
- Do not symlink `.devcontainer/` — each codespace/project may override it with different base images or features
