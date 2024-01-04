#!/bin/sh

# compose key
setxkbmap -option compose:menu

# background
while true; do
  wp
  sleep 10m
done &

# bar
while true; do
  xsetroot -name "  bat: $(acpi | grep -o '[0-9]*%')  //  $(date +'%a %b %d :: %I:%M%P')  "
  sleep 5s
done &

# composite
picom -b

# for java apps
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

# start dwm
exec dwm

