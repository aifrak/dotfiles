# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/) for Windows, WSL2, Ubuntu and MacOS with a VS Code-inspired Neovim configuration packed with preinstalled LSPs, linters, formatters and AI skills.

Github Dark Default theme for [wezterm](https://wezterm.org) and [Neovim](https://neovim.io/).

Custom theme for [Oh-My-Posh](https://ohmyposh.dev/).

Still WIP.

[![Last release](https://img.shields.io/github/v/release/aifrak/dotfiles?label=Last%20release)](https://github.com/aifrak/dotfiles/releases)
[![License](https://img.shields.io/github/license/aifrak/dotfiles?color=blue)](https://github.com/aifrak/dotfiles/blob/master/LICENSE)

## Installation

### For Windows

```powershell
# Install scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install chezmoi
chezmoi init aifrak/dotfiles
```

### For WSL2 / Ubuntu

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply aifrak
```

### For MacOS

```sh
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install chezmoi
chezmoi init aifrak/dotfiles
```

## License

[MIT License](https://github.com/aifrak/dotfiles/blob/main/LICENSE)
