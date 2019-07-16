if [ `uname -o` == "Cygwin" ]; then
    ## On window, java is window native.
    #  + java executable use window CLASSPATH variable, which is 
    #    SEMICOLON separated.
    #  + CLASSPATH could be defined in native windows' environment
    #    variable, then import automatically by cygwin. But it's
    #    Ok to duplicate it in bash again.
    antlr_root=`readlink ~/.antlr`
    antlr_jar=`cygpath -w ${antlr_root}/antlr-4.7.2-complete.jar`
    jdk_lib_lnx=$(dirname "$(dirname "`which java`")")/lib
    jdk_lib=`cygpath -w $jdk_lib_lnx`
    export CLASSPATH=".;${antlr_jar};${jdk_lib};$CLASSPATH"
else
    ## on POSIX system, CLASSPATH is COLON separated.
    export CLASSPATH=".:~/.antlr/antlr-4.7.2-complete.jar"
fi

alias antlr4="java org.antlr.v4.Tool"
alias grun="java org.antlr.v4.gui.TestRig"

#alias antlr4py="java org.antlr.v4.Tool -Dlanguage=Python3"
#pip3 install antlr4-python3-runtime
