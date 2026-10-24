# Linux Bootstrap

My personal bootstrap workflow for setting up a fresh Debian minimal machine.

This repository contains the commands, preferences, and steps I use to turn a bare Debian installation into a clean, usable workstation or server. It is intentionally simple, repeatable, and focused on a minimal Debian base.

## Why this repository exists

When I install Debian from a minimal ISO, I want a consistent setup that includes:

- a non-root user with sudo access
- basic system updates and package installation
- core development tools
- shell and terminal customization
- Git configuration
- optional extras depending on the machine role

## Supported systems

This workflow is aimed at:

- Debian 12 (Bookworm)
- Debian 11 (Bullseye)
- minimal or netinst installations
- personal laptops, desktops, and lightweight servers

## Basic fresh install flow

After installing Debian, log in as root and run:

```bash
apt update && apt upgrade -y
apt install -y sudo git curl ca-certificates build-essential wget gnupg openssh-client
```

Create a user:

```bash
adduser <username>
usermod -aG sudo <username>
```

Then log in as that user and continue.

## Core packages

These are the utilities I usually install on any Debian machine:

```bash
sudo apt install -y \
  git \
  curl \
  wget \
  jq \
  htop \
  ripgrep \
  fd-find \
  unzip \
  tar \
  tmux \
  zsh \
  neofetch \
  ca-certificates \
  apt-transport-https
```

## Shell setup

I prefer a minimal modern shell environment with zsh and tmux.

```bash
chsh -s $(which zsh)
```

If using dotfiles or custom shell configuration, clone them after the system is ready:

```bash
git clone https://github.com/<you>/<your-dotfiles>.git ~/.dotfiles
```

## Development tools

For a personal workstation, I commonly install:

```bash
sudo apt install -y \
  python3 \
  python3-pip \
  python3-venv \
  nodejs \
  npm \
  default-jdk \
  docker.io \
  docker-compose-plugin
```

For Node tooling, I often use nvm:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

## Git configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

## SSH setup

Generate a key if you do not already have one:

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

Then add the public key to GitHub, GitLab, or your remote servers.

## Security basics

I keep the base setup simple but secure:

- install security updates regularly
- use sudo instead of direct root login
- restrict SSH key-based access
- enable unattended upgrades when appropriate

Example:

```bash
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

## Optional extras

Depending on the purpose of the machine, I may add:

- VS Code or another editor
- cloud CLIs
- Docker development stacks
- local backup tools
- desktop environment packages
- custom monitoring tools

## Final result

After running this bootstrap process, the system should be ready for daily work:

- clean Debian base
- regular user with sudo
- Git configured
- development tools available
- shell environment ready to customize
- repeatable setup for new machines

## Notes

This repository reflects my personal preferences for Debian systems. It is intentionally opinionated but easy to adapt for your own use.

## License

This is a personal bootstrap configuration and can be reused or adapted freely.
