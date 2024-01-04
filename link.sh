#!/bin/sh

dots=$(realpath "$1")
conf="$dots"/config
scripts="${dots}"/scripts

if [ -z "$dots" ]; then
  echo "usage: $0 dotsdir"
  exit 1
fi

echo 'Linking files...'

ln -sf "$dots"/zshenv    "$HOME"/.zshenv
ln -sf "$dots"/zprofile  "$HOME"/.zprofile
ln -sf "$dots"/zshrc     "$HOME"/.zshrc
ln -sf "$dots"/vimrc     "$HOME"/.vimrc
ln -sf "$dots"/xinitrc   "$HOME"/.xinitrc

ln -sf "$conf"/zathurarc "$HOME"/.config/zathura/zathurarc
ln -sf "$conf"/newsboat  "$HOME"/.newsboat/config

ln -sf "$scripts"/wp.sh  "$HOME"/.local/bin/wp

