# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

# ---------------------------------------------- #
#                  Install zinit                 #
# ---------------------------------------------- #

if [[ ! -f "${HOME}/.zinit/bin/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  mkdir -p "${HOME}/.zinit" && chmod g-rwX "${HOME}/.zinit"
  git clone https://github.com/zdharma/zinit "${HOME}/.zinit/bin" \
    && print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" \
    || print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${HOME}/.zinit/bin/zinit.zsh"

# ---------------------------------------------- #
#                     Plugins                    #
# ---------------------------------------------- #

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# fix underline in VSCode Terminal
local znt_history_active_text=reverse

zinit wait lucid for \
  OMZL::directories.zsh \
  OMZL::git.zsh \
  OMZL::grep.zsh \
  OMZL::history.zsh \
  OMZL::key-bindings.zsh \
  OMZP::cp \
  OMZP::colored-man-pages \
  OMZP::command-not-found \
  OMZP::copydir \
  OMZP::copyfile \
  OMZP::dirhistory \
  OMZP::extract \
  OMZP::colorize \
  OMZP::git \
  OMZP::globalias \
  OMZP::zsh-interactive-cd \
  Aloxaf/fzf-tab \
  agkozak/zsh-z \
  psprint/zsh-navigation-tools \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" zdharma/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  as"completion" OMZP::fzf

# ---------------------------------------------- #
#                      asdf                      #
# ---------------------------------------------- #

# asdf is installed via "./install"
export ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
source "${ASDF_DIR}/asdf.sh"
zinit fpath -f "${ASDF_DIR}/completions"
zicompinit

# ---------------------------------------------- #
#                     elixir                     #
# ---------------------------------------------- #

# option "--elixir" will uncomment this line
# local dotfiles_elixir=1

if [[ ${dotfiles_elixir:-0} -eq 1 ]]; then
  export ERL_AFLAGS="-kernel shell_history enabled"

  zinit wait lucid for \
    gusaiani/elixir-oh-my-zsh \
    as"completion" https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/mix/_mix \
    as"completion" OMZP::mix-fast
fi

# ---------------------------------------------- #
#                      Theme                     #
# ---------------------------------------------- #

ZSH_THEME="powerlevel10k/powerlevel10k"

zinit ice depth"1" atload"source ~/.p10k.zsh"
zinit light romkatv/powerlevel10k

# ---------------------------------------------- #
#                   zsh options                  #
# ---------------------------------------------- #

# Just to make sure that the options are defined
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

# ---------------------------------------------- #
#                     Aliases                    #
# ---------------------------------------------- #

# LSDeluxe
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
