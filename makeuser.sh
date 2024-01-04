!/usr/bin/env sh

set -ex

pacman --noconfirm -Syu
pacman --noconfirm -S sudo

useradd -m -G wheel -s zsh ryan
passwd ryan
visudo
