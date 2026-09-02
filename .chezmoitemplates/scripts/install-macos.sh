#!/usr/bin/env bash

echo "Install for MacOS"

# -- Install tools

brew install git mise
brew install --cask font-fira-code-nerd-font wezterm@nightly
curl -fsSL https://get.jetify.com/devbox | bash
{{- if .isPersonal }}
brew install --cask keepassxc
{{- end }}


# delta
brew install less
# snacks.nvim (image) - PDF preview
brew install ghostscript
# snacks.nvim (image) - Image preview
brew install imagemagick
# lua
# cannot be installed with mise without building from source
brew install lua@5.1 luarocks

# git-ai
curl -sSL https://usegitai.com/install.sh | bash
