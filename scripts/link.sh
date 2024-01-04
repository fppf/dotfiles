#!/bin/sh

dots=$(realpath "$1")
conf="$dots"/config
scripts="$dots"/scripts

if [ -z "$dots" ]; then
  echo "usage: $0 DOTSDIR"
  exit 1
fi

sudo -v

ln -sf "$dots"/zshenv    "$HOME"/.zshenv
ln -sf "$dots"/zprofile  "$HOME"/.zprofile
ln -sf "$dots"/zshrc     "$HOME"/.zshrc
ln -sf "$dots"/xinitrc   "$HOME"/.xinitrc

mkdir -p "$HOME"/.config/git
mkdir -p "$HOME"/.config/paru
mkdir -p "$HOME"/.config/bspwm
mkdir -p "$HOME"/.config/sxhkd
mkdir -p "$HOME"/.config/polybar
mkdir -p "$HOME"/.config/zathura
mkdir -p "$HOME"/.config/newsboat
mkdir -p "$HOME"/.config/nvim

ln -sf "$conf"/gitconfig   "$HOME"/.config/git/config
ln -sf "$conf"/bspwmrc     "$HOME"/.config/bspwm/bspwmrc
ln -sf "$conf"/sxhkdrc     "$HOME"/.config/sxhkd/sxhkdrc
ln -sf "$conf"/zathurarc   "$HOME"/.config/zathura/zathurarc
ln -sf "$conf"/paru.conf   "$HOME"/.config/paru/paru.conf
ln -sf "$conf"/newsboat    "$HOME"/.config/newsboat/config
ln -sf "$conf"/polybar.ini "$HOME"/.config/polybar/config.ini
ln -sf "$conf"/init.lua    "$HOME"/.config/nvim/init.lua

ln -sf "$scripts"/wp.sh      "$HOME"/.local/bin/wp
ln -sf "$scripts"/lock.sh    "$HOME"/.local/bin/lock
ln -sf "$scripts"/polybar.sh "$HOME"/.config/polybar/launch.sh
ln -sf "$scripts"/ufetch.sh  "$HOME"/.local/bin/ufetch
sudo ln -sf "$scripts"/saver_feh /usr/local/libexec/xsecurelock/saver_feh
