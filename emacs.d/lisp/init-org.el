
;; Babel
(org-babel-do-load-languages
    'org-babel-load-languages
    '(
      (ditaa . t)
      (dot . t)
      ))

;; ditaa
(if *cygwin* (setq org-babel-ditaa-java-cmd "~/.emacs.d/site-lisp/ditaa/call-ditaa.cygwin.sh"))
(setq org-ditaa-jar-path "~/.emacs.d/site-lisp/ditaa/ditaa0_9.jar")

(provide 'init-org)
