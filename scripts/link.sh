#!/bin/sh

dots=$(realpath "$1")
conf="$dots"/config
scripts="$dots"/scripts

if [ -z "$dots" ]; then
  echo "usage: $0 DOTSDIR"
  exit 1
fi

echo 'Linking files...'

ln -sf "$dots"/zshenv    "$HOME"/.zshenv
ln -sf "$dots"/zprofile  "$HOME"/.zprofile
ln -sf "$dots"/zshrc     "$HOME"/.zshrc
ln -sf "$dots"/vimrc     "$HOME"/.vimrc
ln -sf "$dots"/xinitrc   "$HOME"/.xinitrc
ln -sf "$dots"/gitconfig "$HOME"/.gitconfig

ln -sf "$conf"/bspwmrc   "$HOME"/.config/bspwm/bspwmrc
ln -sf "$conf"/sxhkdrc   "$HOME"/.config/sxhkd/sxhkdrc
ln -sf "$conf"/zathurarc "$HOME"/.config/zathura/zathurarc
ln -sf "$conf"/newsboat  "$HOME"/.newsboat/config
ln -sf "$conf"/polybar.ini "$HOME"/.config/polybar/config.ini

ln -sf "$scripts"/wp.sh     "$HOME"/.local/bin/wp
ln -sf "$scripts"/lock.sh   "$HOME"/.local/bin/lock
ln -sf "$scripts"/ufetch.sh "$HOME"/.local/bin/ufetch
sudo ln -sf "$scripts"/saver_feh /usr/local/libexec/xsecurelock/saver_feh
