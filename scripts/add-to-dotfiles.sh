#!/bin/sh

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

add_to_dotfiles() {
  target="$1"
  dotfiles_container="$HOME/dotfiles/home"

  mv $1 $dotfiles_container

  link "$dotfiles_container/$1" "$PWD/$1"
}
