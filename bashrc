
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# enable module as early as possible
if [ `uname -o` == "Cygwin" ]; then
    source ~/tools/modules/tcl8.6/4.2.5/init/bash
elif [ `uname -o` == "GNU/Linux" ]; then
    if [[ -z $(command -v module) ]]; then
        echo "Error  : modules not available yet"
    fi
fi
if [[ `type -t module` ==  "function" ]]; then
    ## customize path define below
    echo "Info   : module enabled!";
fi

if [[ -z $(command -v module) ]]; then
    ### tools (high priority)
    #export LD_LIBRARY_PATH=/home/qili/tools/local/lib:${LD_LIBRARY_PATH}
    #export PATH=/home/qili/tools/local/bin:/usr/local/bin:${PATH}
    printf ""
else
    #module load dot
    #module load modules
    #module load tools
    printf ""
fi

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
    ## x server
    export DISPLAY=:0.0

    ## java se on windows
    # since jdk path is set in windows, no need to add again
    #export PATH=/cygdrive/c/Program\ Files/Java/jdk-11.0.3/bin:${PATH}
elif [ `uname -o` == "GNU/Linux" ]; then
    printf ""
    # anaconda should be enabled by default!!!

    ## added by Anaconda3 2018.12 installer
    ## >>> conda init >>>
    ## !! Contents within this block are managed by 'conda init' !!
    #__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/qili/tools/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
    #if [ $? -eq 0 ]; then
    #    \eval "$__conda_setup"
    #else
    #    if [ -f "/home/qili/tools/anaconda3/etc/profile.d/conda.sh" ]; then
    #        . "/home/qili/tools/anaconda3/etc/profile.d/conda.sh"
    #        CONDA_CHANGEPS1=false conda activate base
    #    else
    #        \export PATH="/home/qili/tools/anaconda3/bin:$PATH"
    #    fi  
    #fi
    #unset __conda_setup
    ## <<< conda init <<<
fi

PATH=/home/qili/.local/bin:$PATH
