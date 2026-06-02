# Necessary to load installed tools for custom chezmoi scripts
$env:PATH = "$env:USERPROFILE\scoop\shims;$env:PATH"
$env:PATH = "$env:LOCALAPPDATA\mise\shims;$env:PATH"
mise activate pwsh | Out-String | Invoke-Expression
