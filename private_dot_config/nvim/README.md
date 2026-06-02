# Neovim Config

Built with **lazy.nvim**, with Github Dark Default theme.

## Installation

- [For Windows](#windows-install)
- [For Ubuntu / WSL](#ubuntu-wsl-install)
- [For MacOS](#macos-install)

### For Windows {#windows-install}

- Install [scoop](https://scoop.sh/).

- Install [git](https://git-scm.com/):

```powershell
scoop install main/git
```

- Install [FiraCode Nerd Font](https://www.nerdfonts.com):

```powershell
scoop install nerd-fonts/FiraCode-NF
```

- Install [oh-my-posh](https://ohmyposh.dev/):

```powershell
scoop install main/oh-my-posh
```

- Install [mise](https://mise.en.dev/installing-mise.html):

```powershell
scoop install main/mise
scoop install extras/vcredist2022
```

- Install [Neovim](https://neovim.io/) 0.12+:

```powershell
scoop install main/neovim
```

- Install [wezterm](https://wezterm.org/) nightly (stable version misses features):

```powershell
scoop install versions/wezterm-nightly
```

- Clone this repository.
- Add symlinks (backup old files if necessary):

```powershell
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "$env:USERPROFILE\dotfiles\powershell\profile.ps1"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\mise\config.toml" -Target "$env:USERPROFILE\dotfiles\mise\mise.windows.toml"
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.markdownlint.json" -Target "$env:USERPROFILE\dotfiles\.markdownlint.json"
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
scoop install versions/lua51
scoop install main/luarocks
```

### For Ubuntu {#ubuntu-wsl-install}

- Install [git](https://git-scm.com/):

```bash
sudo apt update
sudo apt install git
```

- Install [zsh](https://www.zsh.org/):

```bash
sudo apt install zsh
```

- _(not needed for WSL)_ Install [FiraCode Nerd Font](https://www.nerdfonts.com):

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv
```

- Install [oh-my-posh](https://ohmyposh.dev/):

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

- Install [mise](https://mise.en.dev/installing-mise.html):

```bash
curl https://mise.run | sh
```

- Install [Neovim](https://neovim.io/) 0.12+:

```bash
sudo apt-add-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

1. _(not needed for WSL)_ Install [WezTerm](https://wezterm.org/) nightly:

```bash
curl -fLo /tmp/wezterm.deb https://github.com/wez/wezterm/releases/latest/download/wezterm-nightly.Ubuntu22.04.deb
sudo apt install /tmp/wezterm.deb
```

```sh
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/mise/mise.unix.toml ~/.config/mise/config.toml
ln -s ~/dotfiles/.markdownlint.json ~/.markdownlint.json
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

1. Install [Homebrew](https://brew.sh/).

1. Install [git](https://git-scm.com/):

```bash
brew install git
```

1. Install [FiraCode Nerd Font](https://www.nerdfonts.com):

```bash
brew install --cask font-fira-code-nerd-font
```

1. Install [oh-my-posh](https://ohmyposh.dev/):

```bash
brew install oh-my-posh
```

1. Install [mise](https://mise.en.dev/installing-mise.html):

```bash
brew install mise
```

1. Install [Neovim](https://neovim.io/) 0.12+:

```bash
brew install neovim
```

1. Install [WezTerm](https://wezterm.org/) nightly:

```bash
brew install --cask wezterm@nightly
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
Remove-Item $PROFILE
Remove-Item "$env:LOCALAPPDATA\nvim"
Remove-Item "$env:USERPROFILE\.config\mise\config.toml"
```

### For Ubuntu / WSL and MacOS

```sh
rm ~/.zshrc
rm ~/.config/nvim
rm ~/.config/mise/config.toml
```
