
;; download it manually
;;(add-to-list 'load-path
;;             (expand-file-name "spacemacs-theme" user-emacs-directory))
;;;;(require 'spacemacs-dark)
;;(load-file "~/.emacs.d/spacemacs-theme/spacemacs-dark-theme.el")

;; use myelpa
(require-package 'spacemacs-theme)
(load-theme 'spacemacs-dark t)

(provide 'init-spacemacs-theme)

