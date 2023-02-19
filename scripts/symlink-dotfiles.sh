#!/bin/sh

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

dotfiles_container="$HOME/dotfiles/home"

for location in $(find $dotfiles_container -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link $location "$HOME/$file"
done
