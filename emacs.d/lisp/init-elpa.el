;;; Find and load the correct package.el

;; When switching between Emacs 23 and 24, we always use the bundled package.el in Emacs 24
(let ((package-el-site-lisp-dir
       (expand-file-name "site-lisp/package" user-emacs-directory)))
  (when (and (file-directory-p package-el-site-lisp-dir)
             (> emacs-major-version 23))
    (message "Removing local package.el from load-path to avoid shadowing bundled version")
    (setq load-path (remove package-el-site-lisp-dir load-path))))

(require 'package)


;;; Standard package repositories

;; decide whether to use secure connection for ELPA repositories
(defun add-address-prefix (addr)
  (if (and (boundp 'tls-checktrust)
	   (eq tls-checktrust 'ask))
      (concat "https://" addr)
    (concat "http://" addr)))

;; + remove localelpa, since there's no archive-contents file.
;;   under latest emacs revision, it'll report error.
;;(setq package-archives '(("localelpa" . "~/.emacs.d/localelpa/") ("myelpa" . "~/.emacs.d/myelpa-repos/")))
;;
;; melpa, melpa-stable will require internet connection. If it slow down startup
;; time, remove this two items
(setq package-archives '(
                         ;;("melpa" . "https://melpa.org/packages/")
                         ;;("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("myelpa" . "~/.emacs.d/myelpa-repos/")))
;;(package-refresh-contents)


;; If gpg cannot be found, signature checking will fail, so we
;; conditionally enable it according to whether gpg is available. We
;; re-run this check once $PATH has been configured
(defun sanityinc/package-maybe-enable-signatures ()
  (setq package-check-signature (if (executable-find "gpg") 'allow-unsigned)))

(sanityinc/package-maybe-enable-signatures)
(after-load 'init-exec-path
  (sanityinc/package-maybe-enable-signatures))



;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
        (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION. If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))

;;; Fire up package.el
(setq package-enable-at-startup nil)
(package-initialize)

;; The cl-lib is distributed with Emacs >= 24.3 and is required by many packages.
;; For Emacs version < 24.3, it can be installed via ELPA. But you'd better move
;; the cl-lib.el to PATH/TO/EMACS/lisp/emacs-lisp, otherwise it may break future
;; updating of Emacs.
(unless (package-installed-p 'cl-lib)
  (when (yes-or-no-p "Cannot find cl-lib. Maybe your Emacs is too old,
you'd better update it to >= 24.3. Install the cl-lib now?")
    (require-package 'cl-lib)
    (require 'cl-lib)
    (message "The cl-lib has been automatically installed,
but you'd better update to Emacs >= 24.3.
Or, move the cl-lib.el to 'EMACS-INSTALLATION-PATH/lisp/emacs-lisp'")))

;; (require-package 'fullframe)
;; (fullframe list-packages quit-window)


(require-package 'markdown-mode)
(require-package 'htmlize)
(require-package 'diminish)
(require-package 'ivy)
(require-package 'swiper)
(require-package 'counsel) ; counsel => swiper => ivy
(require-package 'undo-tree)
(require-package 'yasnippet)
;;(require-package 'smex)   ; weird, emacs complain can't find package

(provide 'init-elpa)
