# The following lines were added by compinstall


autoload -Uz compinit promptinit
autoload -U colors && colors
compinit

export DIRSTACKSIZE=8
export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
export EDITOR="vim"
export TERM="gnome"
eval `dircolors -b`

setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'
setopt interactivecomments
#setopt autocd
setopt cdablevars
setopt interactivecomments
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt correct correctall
unsetopt menucomplete
setopt longlistjobs
setopt appendhistory autocd nomatch
unsetopt beep extendedglob
unsetopt bgnice
bindkey -e

# extensions
alias -s png='eog'
alias -s jpg='eog'

alias ls='ls -h --color=auto'
alias l='ls'
alias ll='ls -lh'
alias lla='ls -alh'
alias lt='ls -h --color=auto --sort=time'
alias grep='grep --color=auto'
alias e='exit'
alias ..='cd ..'
alias pacman='sudo pacman'
alias vncon='vncserver -geometry 1024x768 -depth 16'
alias vncoff='vncserver -kill :1'
alias mc='env LANG=en_US.utf8 mc'
alias sshuni='ssh -Y sidekell@faui0sr0.informatik.uni-erlangen.de'
alias sshome='ssh -p 1501 -Y -C -L 5901:localhost:5901 ict@ictbox.no-ip.org'
alias man='LC_ALL=C LANG=C man'

#promptinit && prompt walters
PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}]$ "
#RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" history-search-backward # PageUp
bindkey "\e[6~" history-search-forward # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

function mkcd()
{
    mkdir -p "$1" && cd "$1"
}

function x()
{ 
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)  tar xjf "$1"      ;;
            *.tar.gz)   tar xzf "$1"      ;;
            *.tar.Z)    tar xzf "$1"      ;;
            *.bz2)      bunzip2 "$1"      ;;
            *.rar)      unrar x "$1"      ;;
            *.gz)       gunzip "$1"       ;;
            *.jar)      unzip "$1"        ;;
            *.tar)      tar xf "$1"       ;;
            *.tbz2)     tar xjf "$1"      ;;
            *.tgz)      tar xzf "$1"      ;;
            *.zip)      unzip "$1"        ;;
            *.Z)        uncompress "$1"   ;;
            *)          echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a file"
    fi
}

function s() 
{ 
    tmux -2 attach -t work || tmux -2 new -s work 
}

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt '%e errors corrected'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 0
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' menu select=1 
zstyle :compinstall filename '/home/ict/.zshrc'

zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -u${USER} -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

autoload -Uz compinit
compinit
# End of lines added by compinstall
