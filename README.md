# Development environment

Installation script of development environment (Debian).

[![Last release](https://img.shields.io/github/v/release/aifrak/dev-env?label=Last%20release)](https://github.com/aifrak/dev-env/releases)
[![License](https://img.shields.io/github/license/aifrak/dev-env?color=blue)](https://github.com/aifrak/dev-env/blob/master/LICENSE)

[![Tests](https://github.com/aifrak/dev-env/actions/workflows/tests.yml/badge.svg)](https://github.com/aifrak/dev-env/actions/workflows/tests.yml)
[![Shell lint](https://github.com/aifrak/dev-env/actions/workflows/shell-lint.yml/badge.svg)](https://github.com/aifrak/dev-env/actions/workflows/shell-lint.yml)
[![Dockerfile lint](https://github.com/aifrak/dev-env/actions/workflows/dockerfile-lint.yml/badge.svg)](https://github.com/aifrak/dev-env/actions/workflows/dockerfile-lint.yml)
[![Markdown lint](https://github.com/aifrak/dev-env/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/aifrak/dev-env/actions/workflows/markdown-lint.yml)

## Warning ⚠️

This is just a personal setup. I don't plan to make it work for other distros or
to improve it.

_Use it at your own risk._

## Requirements ❗

- Debian-based distros
- Superuser rights for dependencies and `lsdeluxe`
- `ca-certificates` to download the necessary files
- `git`

## What is installed by default 🤔

- Dotfiles
- `oh-my-zsh`
- [oh-my-zsh plugins](#oh-my-zsh-plugins)
- `zsh`

### Extra binaries

- [fzf](https://github.com/junegunn/fzf)
- [lsdeluxe](https://github.com/Peltoche/lsd) with its custom aliases

### Optionally installed

#### `--dependencies`

Adding `--dependencies` might be useful, if you do not wish to copy all packages
into the Dockerfile.

This option is not necessary, if all tools are already pre-installed like in
Ubuntu for example.

- `gnupg2`
- `make`
- `openssh-client` for `git`
- `wget`
- `xz-utils`

#### `--node`

- [node](https://github.com/nodejs/node)
- [npm](https://github.com/npm/cli)

#### `--fonts`

- Fonts: [Fira Code from Nerd fonts](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)

#### `--dockerfile`

- [hadolint](https://github.com/hadolint/hadolint): Dockerfile lint

#### `--shellscript`

- [shellcheck](https://github.com/koalaman/shellcheck): Shell lint
- [shfmt](https://github.com/mvdan/sh): Shell format

## How to install 💡

```shell
git clone --single-branch --depth 1 https://github.com/aifrak/dev-env.git
./dev-env/install [YOUR_USER_NAME] [options..]
rm -r ./dev-env
```

`oh-my-zsh` will be installed into the given user `$HOME` directory.

## Script options

```text
Options:
  --dependencies: Install all dependencies to run the install script and oh-my-zsh
  --node:         Install NodeJS and npm
  --dockerfile:   Add binary to lint Dockerfile (hadolint)
  --elixir:       Add plugins and environment variables for Elixir development
  --fonts:        Install Fira Code from Nerd fonts"
  --[no-]zsh:     [Do not] install zsh (install it by default)
  --shellscript:  Add binaries to lint and format Shellscript (shellcheck & shfmt)
```

## Quick references

- **Docker image equivalent**: <https://hub.docker.com/r/aifrak/oh-my-zsh>
- **Github of Docker image**: <https://github.com/aifrak/oh-my-zsh-docker>
- **Changelog**: <https://github.com/aifrak/dev-env/blob/master/CHANGELOG.md>

## Theme

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## Other binaries

- [LSDeluxe](https://github.com/Peltoche/lsd)

## oh-my-zsh plugins

### Installed by default

- colored-man-pages
- colorize
- command-not-found
- cp
- copydir
- copyfile
- dirhistory
- extract
- git
- git-extras
- globalias
- [z](https://github.com/rupa/z)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-interactive-cd](https://github.com/changyuheng/zsh-interactive-cd) + [fzf](https://github.com/junegunn/fzf)
- [zsh-navigation-tools](https://github.com/psprint/zsh-navigation-tools)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Installed with `--elixir`

- mix
- mix-fast

## License

[MIT License](https://github.com/aifrak/dev-env/blob/main/LICENSE)
