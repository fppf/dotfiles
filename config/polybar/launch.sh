#!/bin/sh

killall -q polybar

polybar bar &

if [[ $(xrandr -q | grep 'DP-2 connected') ]]; then
  polybar ext &
fi
