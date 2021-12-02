
(add-to-list 'load-path
             (expand-file-name "qelpa/verilog-mode" user-emacs-directory))

(require 'verilog-mode)
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))

(defun q-verilog-hook ()
    (setq indent-tabs-mode nil)
    (setq verilog-tab-always-indent t)
    (setq tab-width 4)
    (setq verilog-indent-level 4)
    (setq verilog-indent-level-module      4)
    (setq verilog-indent-level-declaration 4)
    (setq verilog-indent-level-behavioral  4)
    (setq verilog-indent-level-directive   1)
    (setq verilog-auto-newline nil)
    (setq show-trailing-whitespace t))
(add-hook 'verilog-mode-hook 'q-verilog-hook)

(provide 'init-verilog)
