# Homebrew Tap for ConnectionApp

Secure tunneling via AWS SSM.

## Installation

Each install command brings the GUI app **and** the `connection-app-cli`
companion binary (the cask depends on the CLI formula on macOS, the
Linux formula does the same).

### macOS (Desktop App + CLI)

```bash
brew tap yarka-guru/tap
brew install --cask connection-app
```

### Linux (x86_64 / ARM64) — GUI + CLI

```bash
brew tap yarka-guru/tap
brew install connection-app
```

### CLI only (any platform)

```bash
brew tap yarka-guru/tap
brew install connection-app-cli
```

## Direct Downloads

Download installers directly from [GitHub Releases](https://github.com/yarka-guru/connection_app/releases/latest):

| Platform | Format |
|----------|--------|
| macOS (Apple Silicon) | `.dmg` |
| macOS (Intel) | `.dmg` |
| Linux (x86_64) | `.deb`, `.rpm`, `.AppImage` |
| Linux (ARM64) | `.deb`, `.AppImage` |
| Windows | `.exe` (NSIS), `.msi` |

## Updating

```bash
brew update
brew upgrade --cask connection-app  # macOS
brew upgrade connection-app          # Linux
```
