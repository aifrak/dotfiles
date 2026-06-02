#!/usr/bin/env bash

# Necessary to load installed tools for custom chezmoi scripts
export PATH="$HOME/.local/share/mise/shims:$PATH"
eval "$(mise activate bash)"
