export ZDOTDIR="$HOME"

export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
