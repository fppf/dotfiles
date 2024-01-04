#!/bin/sh
wall="${HOME}/.wall"

DISPLAY=:0 feh --bg-fill --randomize --recursive "${wall}" 2>/dev/null
