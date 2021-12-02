#!/bin/bash

inst_en="false"

while [[ $# -gt 0 ]]; do
    key=$1
    case $key in
        -i)
                shift
                inst_en="true"
                ;;
        *)
                shift
                echo "unrecognized parameter $key"
    esac
done

## find root directory
#echo " - $0 -"
dir_name_rel=$(dirname $0)
dir_name=$(cd $(dirname $dir_name_rel); pwd -P)/$(basename $dir_name_rel)
echo "source directory = $dir_name"

clean_file () {
    fn=$1
    fn_exist=0
    if [[ -e $fn ]]; then
        fn_exist=1
    elif [[ -L $fn ]]; then
        fn_exist=1
    fi

    if [[ "$fn_exist" -eq 1 ]]; then
        echo "Warning: $1 exist, backup it!"
        mv $1 ${1}.$$.bak
    fi
}

## got work folder
cd $dir_name

## update external resource
echo "Warning: Git submodule operation may fail. If so, manually launch it later."
git submodule update --init --recursive --progress

# emacs binary
if [[ -e myelpa.zip ]]; then
    echo "Info   : MYELPA available already! skip download/unzip."
else
    wget https://github.com/redguardtoo/myelpa/archive/stable.zip -O myelpa.zip
    unzip myelpa.zip
    # move local repos to emacs.d to avoid complex symbol link issue
    mv myelpa-stable emacs.d

    # below is a good refernce, need to compare it with emacs.d I used
    #wget  https://github.com/redguardtoo/emacs.d/archive/stable.zip -O emacs_d.zip
fi

if false; then
    if ! [[ -e ditaa0_9.zip ]]; then
        wget https://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip
        unzip -d ditaa ditaa0_9.zip
    else
        echo "Info   : DITAA available already! skip download/unzip."
    fi
fi

# antlr
if ! [[ -z ${HMENV_ANTLR_EN:x} ]]; then
    if ! [[ -e antlr/antlr-4.7.2-complete.jar ]]; then
        wget https://www.antlr.org/download/antlr-4.7.2-complete.jar
    fi
fi


## install
if [[ "$inst_en" == "true" ]]; then
    # vim
    clean_file ~/.vim
    ln -s ${dir_name}/vim   ~/.vim

    # emacs
    clean_file ~/.emacs.d
    ln -s ${dir_name}/emacs.d ~/.emacs.d

    # git
    clean_file ~/.gitconfig
    ln -s ${dir_name}/gitconfig ~/.gitconfig

    # bash
    clean_file ~/.bashrc
    ln -s ${dir_name}/bashrc ~/.bashrc
    clean_file ~/.bash_functions
    ln -s ${dir_name}/bash_functions ~/.bash_functions

    # tmux
    clean_file ~/.tmux.conf
    ln -s ${dir_name}/tmux.conf ~/.tmux.conf

    # antlr
    clean_file ~/.antlr
    ln -s ${dir_name}/antlr ~/.antlr
    source ~/.antlr/setup.sh

    ## for future tools install
    mkdir -p ~/tools/local

    # maven
    if false; then
        mkdir -p ~/tools/maven
        if ! [[ -e apache-maven-3.6.1-bin.tar.gz ]]; then
            wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
        fi
        if ! [[ -d ~/tools/maven/apache-maven-3.6.1 ]]; then
            tar zxvf apache-maven-3.6.1-bin.tar.gz -C ~/tools/maven
        fi
    fi

    # module
    if false; then
        # module could installed by apt, not compile by myself
        if ! [[ -d ~/tools/modules ]]; then
            echo "Warning: module not exist, need install module as below"
            echo "         cd modules"
            echo "         ./installit.sh"
            echo "         BE CAREFUL WITH THE DEPENDENCY, read readme"
        fi
    fi
fi

##
cd -

