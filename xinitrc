#!/bin/sh

# compose key
setxkbmap -option compose:menu

# background
feh --bg-scale "$HOME"/.wall/"$(ls $HOME/.wall/ | shuf -n1)"

# composite
picom -b

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# start dwm
exec dwm

