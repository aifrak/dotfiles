# Dotfiles

Personal install script for dotfiles, zsh, asdf and zinit (Debian).

[![Last release](https://img.shields.io/github/v/release/aifrak/dotfiles?label=Last%20release)](https://github.com/aifrak/dotfiles/releases)
[![CI](https://github.com/aifrak/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/aifrak/dotfiles/actions/workflows/ci.yml)
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
- `keychain` (with `--wsl-ssh`)
- `make`
- `openssh-client` for `git`
- `nano`
- `tar`
- `wget`
- `xz-utils`
- `zsh` (with `--zsh`)

### `--wsl-*` options

#### ⚠️ Before using `--wsl-*` options

- GPG private keys must be imported in WSL and trusted
- SSH keys must be imported in WSL

#### Checklist for WSL setup

- `.gitconfig` is imported in WSL
- GPG private keys are imported in WSL and trusted
- SSH keys are imported in WSL
- [Gpg4win](https://www.gpg4win.org) is installed on Windows
- [Nerd fonts](#fonts) are installed on Windows (used by zsh and lsdeluxe)

### Resources

- [VSCode setup](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials)

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
  --deps          Install all dependencies to install and run the development environment
  --docker        Install zinit plugins for docker and docker compose
  --elixir        Add plugins and environment variables for Elixir development
  --fonts         Install Fira Code from Nerd fonts
  --wsl-gpg       Setup files used by GPG inside WSL
  --wsl-ssh       Install dependencies and setup files used by GPG inside WSL
  --[no-]asdf     [Do not] install asdf (install it by default)
  --[no-]zsh      [Do not] install zsh (install it by default)
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

## FAQ

### Terminal - How to display special symbols correctly?

**Answer:** Use a font starting with `Fura Code` instead of `Fira Code`.

### WSL - How to limit the RAM usage from WSL?

**Answer:** In your
[.wslconfig](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig)
add the following lines:

```text
[wsl2]
memory=2GB
```

More [here](https://github.com/microsoft/WSL/issues/4166) and [here](https://docs.microsoft.com/en-us/windows/wsl/release-notes#build-18945).

### WSL - How to fix the issue when the container does not open or start?

**Answer:** Follow those steps:

1. Start or restart `Docker Desktop`.
1. Open the WSL from a terminal. `keychain` will start an ssh agent and ask your
   password.

### WSL - How to fix "permission denied" with using git (fetch)?

**Answer:** Open the WSL from a terminal. `keychain` will start an ssh agent and
ask your password.

### WSL - How to reload the GPG agent?

**Answer:** Type `gpg-connect-agent reloadagent /bye`

## Theme

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## License

[MIT License](https://github.com/aifrak/dotfiles/blob/main/LICENSE)
