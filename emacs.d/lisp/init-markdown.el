;; copy markdown-mode to elpa
;;(add-to-list 'load-path
;;             (expand-file-name "lisp/markdown-mode" user-emacs-directory))

(require 'markdown-mode)

(autoload 'markdown-mode "markdown-mode"
                    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(provide 'init-markdown)
