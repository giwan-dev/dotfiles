#!/usr/bin/env zsh

echo "Install nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

source ./scripts/symlink-dotfiles.sh

if [[ "$OSTYPE" == darwin* ]]; then
  source ./brew/setup.sh
fi
