#!/usr/bin/env bash

# snacks.nvim (image) - PDF preview
sudo apt install -y ghostscript
# snacks.nvim (image) - Image preview
sudo apt install -y imagemagick
# lua
# cannot be installed with mise without building from source
sudo apt install -y lua5.1 luarocks

# post-install instructions
echo ""
echo "Manual step: add the following at the top of ~/.gitconfig:"
echo ""
echo "[include]"
echo "  path = ~/dotfiles/git/.gitconfig"
echo ""
