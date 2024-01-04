#!/bin/sh

set -e

sum=$(sha1sum "$(which dwm)")
new=''

while true; do
  if [ "$sum" != "$new" ]; then
    sum=$new
    dwm >/dev/null 2>&1
  else
    exit 0
  fi
  new=$(sha1sum "$(which dwm)")
  sleep 1
done

