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

## vim
clean_file ~/.vim
ln -s ${dir_name}/vim   ~/.vim
clean_file ~/.vimrc
ln -s ${dir_name}/vimrc ~/.vimrc

cd $dir_name
git submodule update --init --recursive --progress

## emacs
if [[ -e myelpa.zip ]]; then
    echo "Info   : MYELPA available already! skip download/unzip."
else
    wget https://codeload.github.com/redguardtoo/myelpa/zip/stable -O myelpa.zip
    unzip myelpa.zip
fi

if ! [[ -e ditaa0_9.zip ]]; then
    wget https://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip
    unzip -d ditaa ditaa0_9.zip
else
    echo "Info   : DITAA available already! skip download/unzip."
fi

clean_file ~/.emacs.d
ln -s ${dir_name}/emacs.d ~/.emacs.d

## git
clean_file ~/.gitconfig
ln -s ${dir_name}/gitconfig ~/.gitconfig

## bashrc
clean_file ~/.bashrc
ln -s ${dir_name}/bashrc ~/.bashrc
clean_file ~/.bash_functions
ln -s ${dir_name}/bash_functions ~/.bash_functions

## tmux
clean_file ~/.tmux.conf
ln -s ${dir_name}/tmux.conf ~/.tmux.conf

## antlr
if ! [[ -e antlr/antlr-4.7.2-complete.jar ]]; then
    wget https://www.antlr.org/download/antlr-4.7.2-complete.jar
fi
clean_file ~/.antlr
ln -s ${dir_name}/antlr ~/.antlr
source ~/.antlr/setup.sh

## local
## for future tools install
mkdir -p ~/Util/local

## maven
mkdir -p ~/Util/maven
if ! [[ -e apache-maven-3.6.1-bin.tar.gz ]]; then
    wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
fi
if ! [[ -d ~/Util/maven/apache-maven-3.6.1 ]]; then
    tar zxvf apache-maven-3.6.1-bin.tar.gz -C ~/Util/maven
fi

## module
if ! [[ -d ~/Util/modules ]]; then
    echo "Warning: module not exist, need install module as below"
    echo "         cd modules"
    echo "         ./installit.sh"
    echo "         BE CAREFUL WITH THE DEPENDENCY, read readme"
fi

cd -
