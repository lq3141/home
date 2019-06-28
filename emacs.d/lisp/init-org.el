
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

;; capture
(setq org-capture-templates
    '(("t" "todo" entry (file "gtd.org")
       "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
      ("n" "note" entry (file "gtd.org")
       "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
      ("j" "Journal" entry (file+olp+datetree "diary.org")
       "* %?\n%U\n" :clock-in t :clock-resume t)
     ))

(provide 'init-org)
