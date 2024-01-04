#!/bin/sh
#
# ufetch-arch - tiny system info for arch
# original: https://gitlab.com/jschx/ufetch

os='Arch Linux'
user="${1:-$USER}"
host="${2:-$(cat /etc/hostname)}"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename "${SHELL}")"
block="███"
clrscr=''

while getopts 'c' opt; do
  case "${opt}" in
    c) clrscr=true ;;
    *) ;;
  esac
done

## UI DETECTION

if [ -n "${WM}" ]; then
  ui="${WM}"
  uitype='wm'
elif [ -f "${HOME}/.xinitrc" ]; then
  ui="$(grep -oE '[^ ]+' "${HOME}/.xinitrc" | tail -1)"
  uitype='wm'
else
  ui='unknown'
  uitype='ui'
fi

## DEFINE COLORS

if [ -x "$(command -v tput)" ]; then
  bold="$(tput bold)"
  black="$(tput setaf 0)"
  red="$(tput setaf 1)"
  green="$(tput setaf 2)"
  yellow="$(tput setaf 3)"
  blue="$(tput setaf 4)"
  magenta="$(tput setaf 5)"
  cyan="$(tput setaf 6)"
  white="$(tput setaf 7)"
  reset="$(tput sgr0)"
fi

lc="${reset}${bold}${white}"     # labels
nc="${reset}${bold}${white}"     # user and hostname
ic="${reset}"                    # info
c0="${reset}${blue}"             # first color

colors() {
  for x in 0 1; do
    printf '%19s' ''
    for y in 0 1 2 3 4 5 6 7; do
      printf '\033[%s;3%sm%s' "${x}" "${y}" "${block}"
    done
    printf '\n'
  done
  printf '\n%s' "${reset}"
}

## OUTPUT

if [ -n "${clrscr}" ]; then
  clear
fi

cat <<EOF

${c0}        /\\         ${nc}${user}${ic}@${nc}${host}${reset}
${c0}       /  \\        ${lc}os:        ${ic}${os}${reset}
${c0}      /\\   \\       ${lc}kernel:    ${ic}${kernel}${reset}
${c0}     /  __  \\      ${lc}uptime:    ${ic}${uptime}${reset}
${c0}    /  (  )  \\     ${lc}packages:  ${ic}${packages}${reset}
${c0}   / __|  |__\\\\    ${lc}shell:     ${ic}${shell}${reset}
${c0}  /.\`        \`.\\   ${lc}${uitype}:        ${ic}${ui}${reset}

EOF

colors

