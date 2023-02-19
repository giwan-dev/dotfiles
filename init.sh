#!/usr/bin/env zsh

ROOT_DIR="$HOME/dotfiles"

source "$ROOT_DIR/scripts/symlink-dotfiles.sh"

if [[ "$OSTYPE" == darwin* ]]; then
  source "$ROOT_DIR/scripts/install-brew-bundles.sh"

  echo "Setting user defaults..."
  source "$ROOT_DIR/scripts/set-defaults.sh"
fi
