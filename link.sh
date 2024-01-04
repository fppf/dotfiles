#!/bin/sh

DOTS="$1"

if [ -z "$DOTS" ]; then
  echo "Usage: $0 DOTDIR"
  exit 1
fi

echo 'Linking files...'

ln -sf "$DOTS"/zshenv   "$HOME"/.zshenv
ln -sf "$DOTS"/zprofile "$HOME"/.zprofile
ln -sf "$DOTS"/zshrc    "$HOME"/.zshrc
ln -sf "$DOTS"/vimrc    "$HOME"/.vimrc
ln -sf "$DOTS"/xinitrc  "$HOME"/.xinitrc

ln -sf "$DOTS"/config/zathurarc "$HOME"/.config/zathura/zathurarc
ln -sf "$DOTS"/config/newsboat  "$HOME"/.newsboat/config

ln -sf "$DOTS"/script/wp.sh "$HOME"/.local/bin/wp


