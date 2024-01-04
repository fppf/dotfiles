#!/bin/sh

set -e

[ "$(id -u)" = "0" ] && echo 'Run as nonroot user' && exit 1

INST="$HOME"/.in
DOTS="$HOME"/.df

mkdir -p "$INST"

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
git clone https://aur.archlinux.org/yay.git "$INST"/yay
cd "$INST"/yay
yes | makepkg -si

#
# install suckless
#
echo 'Installing dwm, st...'
git clone https://git.ryankeleti.com/dwm   "$INST"/dwm
git clone https://git.ryankeleti.com/st    "$INST"/st

cd "$INST"/dwm   && git checkout custom && sudo make clean install
cd "$INST"/st    && git checkout custom && sudo make clean install

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
echo 'Linking files...'
ln -sf "$DOTS"/zshenv   "$HOME"/.zshenv
ln -sf "$DOTS"/zprofile "$HOME"/.zprofile
ln -sf "$DOTS"/zshrc    "$HOME"/.zshrc
ln -sf "$DOTS"/vimrc    "$HOME"/.vimrc
ln -sf "$DOTS"/xinitrc  "$HOME"/.xinitrc
ln -sf "$DOTS"/inputrc  "$HOME"/.inputrc

ln -sf "$DOTS"/config/zathurarc "$HOME"/.config/zathura/zathurarc
ln -sf "$DOTS"/config/newsboat  "$HOME"/.newsboat/config

