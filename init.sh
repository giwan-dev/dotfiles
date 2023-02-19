#!/usr/bin/env zsh

ROOT_DIR="$HOME/dotfiles"

source "$ROOT_DIR/scripts/symlink-dotfiles.sh"

if [[ "$OSTYPE" == darwin* ]]; then
  source "$ROOT_DIR/brew/setup.sh"
fi
