# -- Install scoop

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# -- Install tools

scoop bucket add nerd-fonts
scoop bucket add versions
scoop bucket add extras

scoop install main/git
scoop install nerd-fonts/FiraCode-NF
scoop install main/mise
scoop install versions/wezterm-nightly
scoop install extras/psfzf

# -- Symlinks

# powershell
New-Item -ItemType Directory -Path "$env:USERPROFILE\Documents\PowerShell" -Force
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
New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\nvim" -Target "$env:USERPROFILE\dotfiles\nvim"
# markdownlint
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.markdownlint.json" -Target "$env:USERPROFILE\dotfiles\markdownlint\.markdownlint.json"

# -- blink.cmp

# Necessary for Rust to build fuzzy search.
# If build fails: run again `:Lazy build blink.cmp`.

scoop install main/rustup-msvc
scoop install llvm
scoop install mingw
rustup toolchain install stable-x86_64-pc-windows-gnu
rustup default stable-x86_64-pc-windows-gnu

# -- snacks.nvim (image)

# PDF preview
scoop install main/ghostscript
# Image preview
scoop install imagemagick

# -- Lua
# cannot be installed with mise without building from source

scoop install main/lua51
scoop install main/luarocks
