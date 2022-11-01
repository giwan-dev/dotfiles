#!/usr/bin/env zsh

dev="$HOME/Developer"
terminal="$HOME/dotfiles/terminal"

source "$terminal/highlight/setup.sh"
source "$terminal/completion/setup.sh"

alias cl="clear"
alias permission="sudo chown -R $USER"
alias g="git"
alias ls="ls --color=auto"

if [[ "$OSTYPE" == darwin* ]]; then
  alias g-br-clear="git br -vv | grep gone | sed | cut -f 3 -d ' ' | xargs -n 1 git br -D"
fi

# Register directory
hash -d dev="$dev"

# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(starship init zsh)"
fi
