#!/usr/bin/env bash

# snacks.nvim (image) - PDF preview
sudo apt install -y ghostscript
# snacks.nvim (image) - Image preview
sudo apt install -y imagemagick
# lua
# cannot be installed with mise without building from source
sudo apt install -y lua5.1 luarocks

# - Symlinks

mkdir -p ~/.config

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
ln -s ~/dotfiles/nvim ~/.config/nvim
# markdownlint
ln -s ~/dotfiles/markdownlint/.markdownlint.json ~/.markdownlint.json
