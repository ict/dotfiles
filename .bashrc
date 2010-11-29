export HISTIGNORE="&:[bf]g:e:s"
export HISTCONTROL=ignoredups
export EDITOR=vim

alias ls='ls -h --color=auto'
alias l='ls'
alias ll='ls -lh'
alias lla='ls -alh'
alias lt='ls -h --color=auto --sort=time'
alias grep='grep --color=auto'
alias irc='ssh kallisti.nibbler.de'
alias e='exit'
alias ..='cd ..'
alias pacman='sudo pacman'
alias vncon='vncserver -geometry 1024x768 -depth 16'
alias vncoff='vncserver -kill :1'
alias mc='env LANG=en_US.utf8 mc'
alias sshuni='ssh -Y sidekell@faui0sr0.informatik.uni-erlangen.de'
alias sshome='ssh -p 1501 -Y -C -L 5901:localhost:5901 ict@ictbox.no-ip.org'

if [[ $- != *i* ]] ; then
	# Non interactive shell
	return
fi

if [[ "${COLORTERM}" == "gnome-terminal" && "${TERM}" == "xterm"  ]]; then
    export TERM="xterm-256color"
fi


function mkcd()
{
    mkdir "$1" && cd "$1"
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


#Prompt and Titlebar stuff
PS1='[\u@\h $newPWD]\$ '
OPENTITLEBAR="\033]0;"
CLOSETITLEBAR="\007"

#console window titlebar set - sieht man eh nicht im screen
#trap 'printf "${OPENTITLEBAR} `history 1 | cut -b8-` - `pwd` ${CLOSETITLEBAR}"' DEBUG

# Completion stuff
complete -cf sudo
complete -o dirnames -d cd
# Append History instead of overwriting file.
shopt -s histappend
# No empty completion
shopt -s no_empty_cmd_completion
# Write History on Prompt-Display
PROMPT_COMMAND='smartprompt; history -a'
source /etc/bash_completion

function smartprompt
{
#   How many characters of the $PWD should be kept
local pwdmaxlen=30
#   Indicator that there has been directory truncation:
local trunc_symbol=".."
newPWD=$PWD
newPWD=${newPWD/$HOME/\~}

if [ ${#newPWD} -gt $pwdmaxlen ]
then
	local pwdoffset=$(( ${#PWD} - $pwdmaxlen ))
	newPWD="${trunc_symbol}${newPWD:$pwdoffset:$pwdmaxlen}"
fi
}

function s() 
{ 
    tmux attach -t work || tmux -2 new -s work 
}
