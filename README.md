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

Or install the `.deb` package directly:

```bash
# x86_64
curl -LO https://github.com/yarka-guru/connection_app/releases/latest/download/RDS.SSM.Connect_1.7.3_amd64.deb
sudo dpkg -i RDS.SSM.Connect_1.7.3_amd64.deb

# ARM64
curl -LO https://github.com/yarka-guru/connection_app/releases/latest/download/RDS.SSM.Connect_1.7.3_aarch64.deb
sudo dpkg -i RDS.SSM.Connect_1.7.3_aarch64.deb
```

## Updating

```bash
brew update
brew upgrade --cask rds-ssm-connect  # macOS
brew upgrade rds-ssm-connect          # Linux
```
