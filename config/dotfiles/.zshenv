# ---------------------------------------------- #
#                     General                    #
# ---------------------------------------------- #

if [[ ! "$PATH" == *$HOME/.oh-my-zsh-install/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.oh-my-zsh-install/bin"
fi

# Everything from here is commented by default.
# Use options to uncomment them during the install.

# ---------------------------------------------- #
#                     Elixir                     #
# ---------------------------------------------- #

# Keep history for iex:
# export ERL_AFLAGS="-kernel shell_history enabled"
