#!/usr/bin/env bash

snap install chezmoi --classic

# FiraCode Nerd Fonts
mkdir -p ~/.local/share/fonts
(cd ~/.local/share/fonts \
&& curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip \
&& unzip FiraCode.zip \
&& fc-cache -fv)

# wezterm (nightly)
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update -y
sudo apt install -y wezterm-nightly

source "$(dirname "$0")/scripts/install-common-debian.sh"
source "$(dirname "$0")/scripts/install-common-unix.sh"
