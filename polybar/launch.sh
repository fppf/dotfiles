#!/usr/bin/env sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=$(xrandr --query | grep primary | cut -d" " -f1) polybar mybar &

echo "bars launched."
