#!/usr/bin/env zsh

dev="$HOME/Developer"
terminal="$HOME/dotfiles/terminal"

source "$terminal/highlight/setup.sh"
source "$terminal/completion/setup.sh"
source "$terminal/functions.sh"

source "$HOME/dotfiles/scripts/add-to-dotfiles.sh"

alias cl="clear"
alias g="git"
alias pn="pnpm"

# Register directory
hash -d dev="$dev"

if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(starship init zsh)"
fi

# nvm configurations
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
