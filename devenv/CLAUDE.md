# Dev Environment

## Claude Code Persistence

Codespace containers are ephemeral — rebuilds wipe auth tokens, session history, and settings.

- **`remoteUser: "codespace"`** — container runs as `codespace`, so `~/.claude` resolves to `/home/codespace/.claude`
- **`mounts`** — a named Docker volume (`claude-code-config-${devcontainerId}`) mounted at `/home/codespace/.claude` survives rebuilds; `setup.sh` runs `chown -R codespace:codespace` on it because Docker creates new volumes owned by `root`
- **`CLAUDE_CONFIG_DIR`** — explicitly points Claude Code at the same path as the mount; without it, Claude Code may default to a different location and miss the persisted volume

## Locales

Codespace base images can have incomplete or inconsistent locale settings, causing garbled output or tool warnings.

- **`containerEnv`** sets `LANG` and `LC_ALL` to `en_US.UTF-8` inside the container
- **VS Code `locale: "en"`** + the `ms-vscode.vscode-loc-en` extension locks the editor UI language to English
