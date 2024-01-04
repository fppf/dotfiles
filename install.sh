#!/usr/bin/env sh

set -ex

HOME=/home/ryan
INST=$HOME/.in
DOTS=$HOME/.dotfiles

pacman --noconfirm -S base-devel git vim ranger zsh zsh-syntax-highlighting thefuck
pacman --noconfirm -S openssh acpi dialog networkmanager xorg unzip lostfiles
pacman --noconfirm -S i3-gaps i3status i3lock rofi light pulseaudio-alsa feh
pacman --noconfirm -S zathura zathura-pdf-mupdf zathura-djvu zathura-ps
pacman --noconfirm -S terminus-font ttf-liberation
pacman --noconfirm -S chromium code
pacman --noconfirm -S python python-virtualenv python-pip

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git /usr/share/zsh-theme-powerlevel10k

git clone https://aur.archlinux.org/yay.git $INST/yay
cd $INST/yay
makepkg -si

yay -S polybar siji-git

git clone https://git.suckless.org/dmenu $INST/dmenu
git clone https://git.suckless.org/st $INST/st

ln -sf $DOTS/st-config.h $INST/st/config.h
cd $INST/dmenu && make clean install
cd $INST/st && make clean install

mkdir -p /home/ryan/downloads

