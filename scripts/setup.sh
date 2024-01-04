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
echo 'Installing packages...'
sudo pacman --noconfirm -Sy archlinux-keyring
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S base base-devel

grep -v '^#' "$dots$"/packages | grep . | while read -r line; do
  sudo pacman --noconfirm -S "$line"
done

#
# install yay
#
echo 'Installing yay...'
git clone https://aur.archlinux.org/yay.git "$inst"/yay
cd "$inst"/yay
yes | makepkg -si

#
# install st
#
git clone https://git.keleti.dev/st "$inst"/st
cd "$inst"/st && git checkout custom && sudo make clean install

#
# make some directories
#
echo "Configuring directories in $HOME..."
mkdir -p "$HOME"/dl
mkdir -p "$HOME"/tmp
mkdir -p "$HOME"/.wall
mkdir -p "$HOME"/.cache
mkdir -p "$HOME"/.config
mkdir -p "$HOME"/.config/bspwm
mkdir -p "$HOME"/.config/sxhkd
mkdir -p "$HOME"/.config/polybar
mkdir -p "$HOME"/.config/zathura

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
mkdir -p ~/.vim/pack/flazz/start
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim/pack/flazz/start/colorschemes
