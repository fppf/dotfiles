HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST="$HISTSIZE"
HISTFILE="$HOME/.cache/zsh_history"

setopt histignorespace
setopt hist_ignore_all_dups
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt no_auto_remove_slash
setopt appendhistory
setopt interactivecomments
unsetopt BEEP

autoload -U colors && colors

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
zstyle ':completion:*' menu select
compinit -C

case $(tty) in
  (/dev/tty[1-9]) setfont /usr/share/kbd/consolefonts/ter-114n.psf.gz;
                  export PROMPT="[%n %y %~]%# ";
                  export RPROMPT="[%?]" ;;
              (*) export PROMPT=" %F{10}%~%f » ";
                  export RPROMPT="[%F{9}%?%f]" ;;
esac

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[builtin]='fg=#005fd7'
ZSH_HIGHLIGHT_STYLES[command]='fg=#005fd7'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#005fd7'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff0000'

bindkey "^[[H" beginning-of-line
bindkey "[4~" end-of-line
bindkey "^[[P" delete-char

alias ..='cd ../'
alias ...='cd ../../'
alias ls='ls --color=auto'
alias rmswp='rm -f ~/.cache/vim/swap/*'
alias qq='exit'
alias pdf='zathura --fork'
alias x='ranger'

cd

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opam configuration
test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

