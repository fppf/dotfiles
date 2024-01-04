# modified from https://github.com/edward-shen/dotfiles.
export TERM=xterm-256color
#export TERMINAL=st

# ZSH config
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
ZLE_RPROMPT_INDENT=1
#SAVEHIST=50
HISTFILE=$HOME/.zsh_history
setopt histignorespace
setopt HIST_IGNORE_SPACE
setopt no_auto_remove_slash
unsetopt BEEP

# check colors with for code ({000..255}) print -P -- "$code: %F{$code}hi%f"

# check compinit only once a day, should make loading faster
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# oh-my-zsh config
export ZSH=/usr/share/oh-my-zsh
export ZSH_CACHE_DIR="$HOME/.cache/zsh"
# plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(git)
#source $ZSH/oh-my-zsh.sh

# fish highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

case $(tty) in
  (/dev/tty[1-9]) setfont /usr/share/kbd/consolefonts/ter-114n.psf.gz;
                  export PROMPT="[%n@%m/%y %~]%# ";
                  export RPROMPT="[%?]";;
              (*)
  # powerlevel 9k theme
  # using powerlevel 10k because faster
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme;;
esac

# powerlevel 9k config
color1="green"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir dir_writable_joined vcs)
POWERLEVEL9K_USER_DEFAULT_FOREGROUND=$color1
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="236"
POWERLEVEL9K_DIR_HOME_BACKGROUND=$color1
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$color1
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$color1
POWERLEVEL9K_STATUS_OK_BACKGROUND="236"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="34"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="blue"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
POWERLEVEL9K_TIME_BACKGROUND="yellow"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="196"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=$color1
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# adding thefuck alias
eval $(thefuck --alias)

# aliases
alias ..="cd ../"
alias ...="cd ../../"
alias ls="ls --color=auto"
alias rm="rm -i"
alias qq="exit"
alias pdf="zathura --fork"
alias x="ranger"
alias gg='git config user.email "rkeleti22@gmail.com" && git config user.name "ryankeleti"'

#export MAKEFLAGS="-j 8"
source /etc/profile

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

cd
