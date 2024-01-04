export ZDOTDIR="$HOME"

export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.nix-profile/bin"
. "$HOME/.cargo/env"
. "$HOME/.ghcup/env"

# opam configuration
[[ ! -r /home/ryan/.opam/opam-init/init.zsh ]] || source /home/ryan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
