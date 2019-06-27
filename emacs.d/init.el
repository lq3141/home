
(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer

(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *emacs26* (>= emacs-major-version 26))
;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)
(require 'init-exec-path) ;; Set up $PATH
;;(let* ((file-name-handler-alist nil))
;;    (require 'init-elpa))

(defmacro local-require (pkg)
  `(unless (featurep ,pkg)
     (load (expand-file-name
             (cond
               ((eq ,pkg 'bookmark+)
                (format "~/.emacs.d/site-lisp/bookmark-plus/%s" ,pkg))
               ((eq ,pkg 'spacemacs-dark)
                (format "~/.emacs.d/spacemacs-theme/%s-theme" ,pkg))
               (t
                 (format "~/.emacs.d/site-lisp/%s/%s" ,pkg ,pkg))))
           t t)))

(add-to-list 'load-path
             "~/.emacs.d/site-lisp")

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-dired)
(require 'init-recentf)
(require 'init-ivy)
(require 'init-spacemacs-theme)

;;(require 'init-editing-utils)
(require 'init-evil)
(require 'init-verilog)
(require 'init-org)

;;;; smex
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

