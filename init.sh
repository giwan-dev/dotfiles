#!/usr/bin/env zsh

source ./scripts/symlink-dotfiles.sh

if [[ "$OSTYPE" == darwin* ]]; then
  source ./brew/setup.sh
fi
