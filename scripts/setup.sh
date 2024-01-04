#!/bin/sh
set -e

[ "$(id -u)" = "0" ] && echo 'Run as nonroot user' && exit 1

dots="$HOME"/.df
inst="$HOME"/.in

mkdir -p "$inst"

sudo -v

#
# install packages
#
sudo pacman --noconfirm -Sy archlinux-keyring
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm --needed -S base base-devel

grep -v '^#' "$dots"/packages | grep . | while read -r line; do
  sudo pacman --noconfirm --needed -S "$line"
done

#
# install paru
#
git clone https://aur.archlinux.org/paru.git "$inst"/paru
cd "$inst"/paru
makepkg --noconfirm -si
sudo pacman --noconfirm -Rns rust

#
# install rust, haskell
#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

#
# install st
#
git clone https://git.keleti.dev/st "$inst"/st
cd "$inst"/st && git checkout custom && sudo make clean install

#
# install xscreenlock
#
git clone https://github.com/google/xsecurelock.git "$inst"/xsecurelock
cd "$inst"/xsecurelock
sh autogen.sh
./configure --with-pam-service-name=xscreensaver
make
sudo make install

#
# make some directories
#
mkdir -p "$HOME"/dl
mkdir -p "$HOME"/tmp
mkdir -p "$HOME"/.wall
mkdir -p "$HOME"/.local/bin
mkdir -p "$HOME"/.cache

#
# link files
#
sh "$dots"/scripts/link.sh "$dots"

#
# vim plugins
#
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
mkdir -p ~/.vim/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/git-plugins/start/ale
git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
