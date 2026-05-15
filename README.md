# Dotfiles

Personal dotfiles.

A VS Code-inspired Neovim configuration packed with preinstalled LSPs, linters and formatters.

Github Dark Default theme for wezterm and Neovim.

Custom theme for Oh-My-Posh.

Still WIP.

[![Last release](https://img.shields.io/github/v/release/aifrak/dotfiles?label=Last%20release)](https://github.com/aifrak/dotfiles/releases)
[![License](https://img.shields.io/github/license/aifrak/dotfiles?color=blue)](https://github.com/aifrak/dotfiles/blob/master/LICENSE)

## Installation

- [For Windows](#windows-install)
- [For Ubuntu / WSL](#ubuntu-wsl-install)
- [For MacOS](#macos-install)

### For Windows {#windows-install}

- Install [scoop](https://scoop.sh/).

- Install tools:

```powershell
scoop install main/git
scoop install nerd-fonts/FiraCode-NF
scoop install main/oh-my-posh
scoop install main/mise
scoop install main/neovim
scoop install versions/wezterm-nightly
scoop install extras/psfzf
```

- Clone this repository.
- Add symlinks (backup old files if necessary):

```powershell
# powershell
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$env:USERPROFILE\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
# wsl
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.wslconfig" -Target "$env:USERPROFILE\dotfiles\wsl\.wslconfig"
# git
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config\git" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\git\.gitconfig" -Target "$env:USERPROFILE\dotfiles\git\.gitconfig"
# mise
New-Item -ItemType Directory -Path "$env:USERPROFILE\.config\mise" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\mise\config.toml" -Target "$env:USERPROFILE\dotfiles\mise\config.toml"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\mise.toml" -Target "$env:USERPROFILE\dotfiles\mise\mise.windows.toml"
# neovim
New-Item -ItemType Directory -Path "$env:LOCALAPPDATA\nvim" -Force
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"
# markdownlint
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.markdownlint.json" -Target "$env:USERPROFILE\dotfiles\markdownlint\.markdownlint.json"
```

#### blink.cmp

Necessary for Rust to build fuzzy search.

```powershell
scoop install main/rustup-msvc
scoop install llvm
scoop install mingw
rustup toolchain install stable-x86_64-pc-windows-gnu
rustup default stable-x86_64-pc-windows-gnu
```

If build fails: run again `:Lazy build blink.cmp`.

#### snacks.nvim (image)

Some tools need to be installed so that all features of Snacks.image are fully available:

```powershell
# PDF preview
scoop install main/ghostscript
# Image preview
scoop install imagemagick
```

#### Lua

```powershell
scoop install main/lua51
scoop install main/luarocks
```

### For Ubuntu {#ubuntu-wsl-install}

- Install tools:

```bash
sudo apt update -y
sudo apt install -y git
sudo apt install -y zsh
curl -s https://ohmyposh.dev/install.sh | bash -s
curl https://mise.run | sh
sudo apt-add-repository ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install -y neovim
curl -fsSL https://get.jetify.com/devbox | bash
```

- Install for Ubuntu only (not WSL):

```bash
# FiraCode Nerd Fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv

# wezterm (nightly)
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update -y
sudo apt install -y wezterm-nightly
```

- Clone this repository.
- Add symlinks (backup old files if necessary):

```sh
# zshrc
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
# git
mkdir -p ~/.config/git
ln -s ~/dotfiles/git/.gitconfig ~/.config/git/.gitconfig
# mise
mkdir -p ~/.config/mise
ln -s ~/dotfiles/mise/config.toml ~/.config/mise/config.toml
ln -s ~/dotfiles/mise/mise.unix.toml ~/mise.toml
# neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
# markdownlint
ln -s ~/dotfiles/markdownlint/.markdownlint.json ~/.markdownlint.json
```

#### blink.cmp

Necessary for Rust to build fuzzy search.

TBD

If build fails: run again `:Lazy build blink.cmp`.

#### snacks.nvim (image)

Some tools need to be installed so that all features of Snacks.image are fully available:

TBD

#### Lua

TBD

### For MacOS {#macos-install}

- Install [Homebrew](https://brew.sh/).

- Install tools:

```bash
brew install git
brew install --cask font-fira-code-nerd-font
brew install oh-my-posh
brew install mise
brew install neovim
brew install --cask wezterm@nightly
curl -fsSL https://get.jetify.com/devbox | bash
```

- Clone this repository.
- Add symlinks (backup old files if necessary):

```sh
# zshrc
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
# git
mkdir -p ~/.config/git
ln -s ~/dotfiles/git/.gitconfig ~/.config/git/.gitconfig
# mise
mkdir -p ~/.config/mise
ln -s ~/dotfiles/mise/config.toml ~/.config/mise/config.toml
ln -s ~/dotfiles/mise/mise.unix.toml ~/mise.toml
# neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
# markdownlint
ln -s ~/dotfiles/markdownlint/.markdownlint.json ~/.markdownlint.json
```

#### blink.cmp

Necessary for Rust to build fuzzy search.

TBD

If build fails: run again `:Lazy build blink.cmp`.

#### snacks.nvim (image)

Some tools need to be installed so that all features of Snacks.image are fully available:

TBD

#### Lua

TBD

## Uninstall

Snippets to remove symlinks.

### For Windows

```powershell
# wsl
Remove-Item "$env:LOCALAPPDATA\nvim"
# powershell
Remove-Item $PROFILE
# git
Remove-Item "$env:USERPROFILE\.config\git\.gitconfig"
# mise
Remove-Item "$env:USERPROFILE\.config\mise\config.toml"
Remove-Item "$env:USERPROFILE\mise.toml"
# neovim
Remove-Item "$env:USERPROFILE\.wslconfig"
# markdownlint
Remove-Item "$env:USERPROFILE\.markdownlint.json"
```

### For Ubuntu / WSL and MacOS

```sh
# zshrc
rm ~/.zshrc
# git
rm ~/.config/git/.gitconfig
# mise
rm ~/.config/mise/config.toml
rm ~/mise.toml
# neovim
rm ~/.config/nvim
# markdownlint
rm ~/.markdownlint.json
```

## License

[MIT License](https://github.com/aifrak/dotfiles/blob/main/LICENSE)
