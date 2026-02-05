#!/usr/bin/env zsh

# Prompt Customization
if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(starship init zsh)"
fi

dev="$HOME/Developer"

terminal="$HOME/dotfiles/terminal"
source "$terminal/highlight/setup.sh"
source "$terminal/completion/setup.sh"
source "$terminal/functions.sh"
source "$HOME/dotfiles/scripts/add-to-dotfiles.sh"

# Alias
alias cl="clear"
alias g="git"
alias pn="pnpm"

# Register directory
hash -d dev="$dev"

# nvm configurations
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Created by `pipx` on 2024-02-25 08:24:25
export PATH="$PATH:/Users/giwan/.local/bin"

