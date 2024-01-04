#!/bin/sh
set -e

[ "$(id -u)" = "0" ] && echo 'Run as nonroot user' && exit 1

dots="$HOME"/.df
inst="$HOME"/.in

mkdir -p "$inst"

sudo -v

# install paru
git clone https://aur.archlinux.org/paru.git "$inst"/paru
cd "$inst"/paru
makepkg --noconfirm -si
sudo pacman --noconfirm -Rns rust

# install st
git clone https://github.com/fppf/st "$inst"/st
cd "$inst"/st && git checkout custom && sudo make clean install

# install xscreenlock
git clone https://github.com/google/xsecurelock.git "$inst"/xsecurelock
cd "$inst"/xsecurelock
sh autogen.sh
./configure --with-pam-service-name=xscreensaver
make
sudo make install

# make some directories
mkdir -p "$HOME"/dl
mkdir -p "$HOME"/tmp
mkdir -p "$HOME"/.wall
mkdir -p "$HOME"/.local/bin
mkdir -p "$HOME"/.cache

#
# link files
#
sh "$dots"/scripts/link.sh "$dots"
