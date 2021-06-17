# Dotfiles

Personal install script for dotfiles, zsh, asdf and zinit (Debian).

[![Last release](https://img.shields.io/github/v/release/aifrak/dotfiles?label=Last%20release)](https://github.com/aifrak/dotfiles/releases)
[![Tests](https://github.com/aifrak/dotfiles/actions/workflows/tests.yml/badge.svg)](https://github.com/aifrak/dotfiles/actions/workflows/tests.yml)
[![License](https://img.shields.io/github/license/aifrak/dotfiles?color=blue)](https://github.com/aifrak/dotfiles/blob/master/LICENSE)

## Requirements ❗

- Debian-based distros
- Superuser rights
- `ca-certificates` to download the necessary files
- `git`

## What is installed by default 🤔

- Dotfiles
- `asdf`
- [fzf](https://github.com/junegunn/fzf) required by zsh-interactive-`zsh-interactive-cd`
- [lsdeluxe](https://github.com/Peltoche/lsd) with its custom aliases
- `zsh`
- `zinit`

Note: Files are created in the current user's `HOME` folder.

## Optionally installed

### Dependencies

Adding `--deps` might be useful, if you do not wish to copy all packages
into the Dockerfile.

This option is not necessary, if all tools are already pre-installed.

- `curl`
- `gnupg2`
- `make`
- `openssh-client` for `git`
- `nano`
- `tar`
- `wget`
- `xz-utils`

### Fonts

[Fira Code from Nerd fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)

## How to install 💡

```shell
git clone https://github.com/aifrak/dotfiles.git
./dotfiles/install [options...]
```

### Install options

```text
Options:
  --deps:         Install all dependencies to install and run the development environment
  --elixir:       Add plugins and environment variables for Elixir development
  --fonts:        Install Fira Code from Nerd fonts
  --[no-]asdf:    [Do not] install asdf (install it by default)
  --[no-]zsh:     [Do not] install zsh (install it by default)
```

## How to uninstall ➖

```shell
./dotfiles/uninstall
```

Note: Dependencies are not removed.

### How to update ➕

```shell
./dotfiles/uninstall
(cd ./dotfiles && git fetch && git pull)
./dotfiles/install [install options...]
```

## Theme

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## License

[MIT License](https://github.com/aifrak/dotfiles/blob/main/LICENSE)
