# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

plugins=(
  colored-man-pages
  colorize
  command-not-found
  cp
  copydir
  copyfile
  dirhistory
  extract
  git
  git-extras
  globalias
  #  mix
  #  mix-fast
  z
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-navigation-tools
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# fix plugins using autocomplete (docker plugin, fzf, etc)
autoload -U compinit && compinit

# fix underline in VSCode Terminal
local znt_history_active_text=reverse

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
