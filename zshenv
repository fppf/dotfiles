export ZDOTDIR="$HOME"

export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"
export PATH="/home/ryan/.local/share/fnm:$PATH"
eval "`fnm env`"

# opam configuration
[[ ! -r /home/ryan/.opam/opam-init/init.zsh ]] || source /home/ryan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
