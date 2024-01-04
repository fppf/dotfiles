#!/bin/sh

# compose key
setxkbmap -option compose:menu

# background
~/.fehbg

# java apps
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# start bspwm
picom --backend glx --fade-exclude 'class_g = "xsecurelock"' &
polybar &
sxhkd &
exec bspwm
