
(setq debug-on-error t)
(setq exec-path-from-shell-check-startup-files nil)

(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

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
(require 'init-utils-rg)

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
;; 
(require 'init-dired)
(require 'init-recentf)
(require 'init-ivy);    # use counsel instead of smex
(require 'init-spacemacs-theme)

(require 'init-markdown)
(require 'init-yasnippet)

;;(require 'init-editing-utils)
(require 'init-evil)
(require 'init-verilog)
(require 'init-org)
(require 'init-misc)

(when (require 'time-date nil t)
    (message "Emacs startup time: %d seconds."
        (time-to-seconds (time-since emacs-load-start-time))))

