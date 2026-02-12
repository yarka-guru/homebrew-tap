# Homebrew Tap for RDS SSM Connect

Secure database tunneling via AWS SSM.

## Installation

### macOS (Desktop App)

```bash
brew tap yarka-guru/tap
brew install --cask rds-ssm-connect
```

### Linux (x86_64 / ARM64)

```bash
brew tap yarka-guru/tap
brew install rds-ssm-connect
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
brew upgrade --cask rds-ssm-connect  # macOS
brew upgrade rds-ssm-connect          # Linux
```
