oh-my-posh init pwsh --config ~\custom-theme.omp.yml | Invoke-Expression

# ---------------------------------------------- #
#                     Aliases                    #
# ---------------------------------------------- #
Set-Alias -Name ls -Value lsd -Option AllScope

Function lsd_list() { ls -l }
Set-Alias -Name l -Value lsd_list -Option AllScope

Function lsd_all() { ls -a }
Set-Alias -Name la -Value lsd_all -Option AllScope

Function lsd_list_all() { ls -la }
Set-Alias -Name lla -Value lsd_list_all -Option AllScope

Function lsd_tree() { ls --tree }
Set-Alias -Name lt -Value lsd_tree -Option AllScope

# fzf inside PowerShell
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

mise activate pwsh | Out-String | Invoke-Expression
