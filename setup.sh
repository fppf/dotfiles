#!/bin/sh

set -e

[ "$(id -u)" = "0" ] && echo 'Run as nonroot user' && exit 1

dots="$HOME"/.df
inst="$HOME"/.in

mkdir -p "$inst"

sudo -v

#
# install repo packages
#
echo 'Installing packages...'
sudo pacman --noconfirm -Sy archlinux-keyring
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S base base-devel

grep -v '^#' packages | grep . | while read -r line; do
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
# install suckless
#
echo 'Installing dwm, st...'
git clone https://git.ryankeleti.com/dwm   "$inst"/dwm
git clone https://git.ryankeleti.com/st    "$inst"/st

cd "$inst"/dwm   && git checkout custom && sudo make clean install
cd "$inst"/st    && git checkout custom && sudo make clean install

#
# install rust
#
echo 'Installing rust...'
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust.sh
vi rust.sh
sh rust.sh -yv --no-modify-path
rm rust.sh

#
# make some directories
#
echo "Configuring directories in $HOME..."
mkdir -p "$HOME"/dl
mkdir -p "$HOME"/code
mkdir -p "$HOME"/tmp
mkdir -p "$HOME"/.wall
mkdir -p "$HOME"/.cache
mkdir -p "$HOME"/.config
mkdir -p "$HOME"/.config/zathura

#
# link files
#
sh "$dots"/link.sh "$dots"

