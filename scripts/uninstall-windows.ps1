# -- Symlinks

# wsl
Remove-Item "$env:LOCALAPPDATA\nvim"
# powershell
Remove-Item $PROFILE
# git
Remove-Item "$env:USERPROFILE\.config\git\.gitconfig"
# mise
Remove-Item "$env:USERPROFILE\.config\mise\config.toml"
Remove-Item "$env:USERPROFILE\mise.toml"
# neovim
Remove-Item "$env:USERPROFILE\.wslconfig"
# markdownlint
Remove-Item "$env:USERPROFILE\.markdownlint.json"
