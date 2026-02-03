# Dotfiles

Modern dotfiles configuration using [Starship](https://starship.rs/) prompt and Fish shell.

## Installation

Clone the repository:

```bash
git clone https://github.com/kylefritz/dotfiles.git ~/.dotfiles
```

### Personal Setup

For personal machines:

```bash
~/.dotfiles/install-dotfiles
```

This installs [starship.personal.toml](starship.personal.toml) with:

- Jujutsu (jj) auto-initialization
- Git branch styling
- Command duration display
- Minimalist prompt configuration

### Work Setup

For work machines with AWS/OIDC authentication:

```bash
~/.dotfiles/install-work-dotfiles
```

This installs [starship.work.toml](starship.work.toml) with everything from personal plus:

- AWS/OIDC authentication expiry warnings
- Requires `~/.local/bin/check-auth-expiry.sh`

## Configuration Files

- [starship.personal.toml](starship.personal.toml) - Personal machine configuration
- [starship.work.toml](starship.work.toml) - Work machine configuration with auth checks
- [install-dotfiles](install-dotfiles) - Personal installation script
- [install-work-dotfiles](install-work-dotfiles) - Work installation script

Both configurations symlink to `~/.config/starship.toml`.
