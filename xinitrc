#!/bin/sh

# compose key
setxkbmap -option compose:menu

# background
while true; do
  wp
  sleep 10m
done &

# java apps
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# start bspwm
picom &
polybar &
sxhkd &
exec bspwm
