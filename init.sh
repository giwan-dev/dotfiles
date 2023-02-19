#!/usr/bin/env zsh

echo "Install nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

ROOT_DIR="$HOME/dotfiles"

source "$ROOT_DIR/scripts/symlink-dotfiles.sh"

if [[ "$OSTYPE" == darwin* ]]; then
  source "$ROOT_DIR/brew/setup.sh"
fi
