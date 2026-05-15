#!/usr/bin/env bash

# -- Install tools

sudo apt update -y
sudo apt install -y git
sudo apt install -y zsh
curl https://mise.run | sh
curl -fsSL https://get.jetify.com/devbox | bash
