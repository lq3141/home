if ! [[ -e apache-maven-3.6.1-bin.tar.gz ]]; then
    wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz
else
    echo "Info   : maven tar ball exist already, skip download."
fi

mkdir -p ~/Util/maven
if ! [[ -d ~/Util/maven/apache-maven-3.6.1 ]]; then
    tar zxvf apache-maven-3.6.1-bin.tar.gz -C ~/Util/maven
else
    echo "Info   : maven binary exist already, skip untar."
fi

