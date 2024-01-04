#!/bin/sh

# compose key
setxkbmap -option compose:menu

# background
~/.fehbg

# auto locking
xset s on
xset s 300 10
xss-lock -n /usr/local/libexec/xsecurelock/dimmer -l -- lock &

# java apps
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

#/usr/bin/prime-offload

# start bspwm
picom --backend glx --fade-exclude 'class_g = "xsecurelock"' &
exec bspwm
