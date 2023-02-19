#!/usr/bin/env zsh

dev="$HOME/Developer"
terminal="$HOME/dotfiles/terminal"

source "$terminal/highlight/setup.sh"
source "$terminal/completion/setup.sh"
source "$HOME/dotfiles/scripts/add-to-dotfiles.sh"

alias cl="clear"
alias permission="sudo chown -R $USER"
alias g="git"

# Register directory
hash -d dev="$dev"

if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(starship init zsh)"
fi

# exa config
TIME_STYLE="iso"
export TIME_STYLE
alias ls="exa"
alias l="exa --header --long --all"

# nvm configurations
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
