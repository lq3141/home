#+begin_src sh :tangle yes :shebang #!/usr/bin/env bash
    #
    # Convert to windows file paths.
    #
    java $1 $2 "$(cygpath -w $3)" "$(cygpath -w $4)" "$(cygpath -w $5)"
#+end_src
