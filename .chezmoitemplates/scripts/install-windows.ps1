Write-Host "Install for Windows"

# -- Install tools

scoop bucket add nerd-fonts
scoop bucket add versions
scoop bucket add extras

scoop install main/git
scoop install main/sed
scoop install main/file
scoop install main/grep
scoop install nerd-fonts/FiraCode-NF
scoop install main/mise
scoop install extras/vcredist2022
scoop install versions/wezterm-nightly
scoop install extras/psfzf
{{- if .isPersonal }}
scoop install extras/keepassxc
{{- end }}

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

scoop install versions/lua51
scoop install main/luarocks

# git-ai
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm http://usegitai.com/install.ps1 | iex"
