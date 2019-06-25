
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

## utils (high priority)
export LD_LIBRARY_PATH=/home/qili/Util/local/lib:${LD_LIBRARY_PATH}
export PATH=/home/qili/Util/local/bin:/usr/local/bin:${PATH}

# projects
#newgrp sha_dig
alias cdw='cd /projects/ATHENA/users/qili'

# qili
# vpn connection only
alias sshvnc="ssh 10.10.25.22"

# if not running interactively, don't do anything
# two command line below are same effect
#[[ "$-" != *i* ]] && return
[ -z "$PS1" ] && return

## general
export TERM=xterm-256color

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls -hF --color=tty'
alias grep='grep --color'
alias df='df -h'
alias du='du -h'

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
PURPLE='\[\033[1;17m\]'
#RED='\[\033[0;31m\]'
YRED='\[\033[48;5;16;38;5;125m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
#NORMAL='\[\033[1;32m\]'
NORMAL='\[\033[48;5;0;38;5;214m\]'
PS1="${BLUE}(${PURPLE}\u@\h${BLUE}) ${NORMAL}\W ${YRED}\e[1m\$ \e[0m${BGREEN}"

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
umask 037
# Paranoid: neither group nor others have any perms:
# umask 077

## login to evine
# vnc to 192.168.1.10:12
# then
#ssh irv-11

## bash completion source
# https://serverfault.com/questions/506612/standard-place-for-user-defined-bash-completion-d-scripts

if [ -f "${HOME}/.bash_aliases" ]; then
    source "${HOME}/.bash_aliases"
fi
if [ -f "${HOME}/.bash_functions" ]; then
    source "${HOME}/.bash_functions"
fi

if [ `uname -o` == "Cygwin" ]; then
    export DISPLAY=:0.0

    # added by Anaconda3 2018.12 installer
    # >>> conda init >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/qili/Util/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
    if [ $? -eq 0 ]; then
        \eval "$__conda_setup"
    else
        if [ -f "/home/qili/Util/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/qili/Util/anaconda3/etc/profile.d/conda.sh"
            CONDA_CHANGEPS1=false conda activate base
        else
            \export PATH="/home/qili/Util/anaconda3/bin:$PATH"
        fi  
    fi
    unset __conda_setup
    # <<< conda init <<<
fi
