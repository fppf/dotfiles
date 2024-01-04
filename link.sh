#!/usr/bin/env sh

set -ex

HOME=/home/ryan
INST=$HOME/.in
DOTS=$HOME/.dotfiles

mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/polybar
ln -sf $DOTS/zshrc $HOME/.zshrc
ln -sf $DOTS/vimrc $HOME/.vimrc
ln -sf $DOTS/xinitrc $HOME/.xinitrc
ln -sf $DOTS/inputrc $HOME/.inputrc
ln -sf $DOTS/i3config $HOME/.config/i3/config
rm -rf $HOME/.config/polybar
ln -sf $DOTS/polybar $HOME/.config/polybar


