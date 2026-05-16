#!/usr/bin/env bash

# -- Install tools

brew install git \
brew install --cask font-fira-code-nerd-font
brew install mise
brew install chezmoi
brew install --cask wezterm@nightly
curl -fsSL https://get.jetify.com/devbox | bash

source "$(dirname "$0")/scripts/install-common-unix.sh"
