#!/bin/sh

brewfile_container="$HOME/dotfiles/brew"

for brewfile in $(find $brewfile_container -name 'Brewfile*'); do
  file_name="${brewfile##*/}"
  echo $file_name

  echo "$file_name 번들을 설치하려 합니다. 설치하시겠습니까? (y/N)"
  read yes

  if [ $yes = "y" ]; then
    echo "Install $file_name bundle..."

    brew bundle --file="$brewfile"
  fi
done
