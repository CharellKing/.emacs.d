(require 'package)

;; (setq configuration-layer--elpa-archives
;;     '(("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
;;       ("org-cn"   . "http://elpa.zilongshanren.com/org/")
;;       ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")))

;; (setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
;;  			 ("gnu" . "http://elpa.gnu.org/packages/")
;;                           ("melpa-stable" . "https://stable.melpa.org/packages/")
;;  			 ("melpa" . "https://melpa.org/packages/")
;;  			 ("org" . "http://orgmode.org/elpa/")))

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("marmalade" . "http://elpa.emacs-china.org/marmalade/")
			 ("org" . "http://elpa.emacs-china.org/org/")
			 ("Sunrise Commander ELPA" . "http://elpa.emacs-china.org/sunrise-commander/")
			 ("user42 ELPA" . "http://elpa.emacs-china.org/user42/")
			 ))

(package-initialize)


(require 'cl)
(defvar packages-list
  '(
    smex
    helm
    yasnippet
    smartparens
    window-numbering
    ibuffer
    magit
    psvn
    package
    vlf
    goto-chg
    slime
    emamux
    hideshow
    web-beautify
    weechat
    vimish-fold
    projectile
    flx-ido
    highlight-indentation
    ;; fill-column-indicator
    xclip
    elfeed
    elfeed-org
    elfeed-goodies
    powerline
    popwin

    company
    company-web
    company-jedi
    slime-company
    flymake-shell

    paredit
    markdown-mode
    js2-mode
    json-mode
    flymake-jslint
    web-mode
    json-mode
    protobuf-mode
    php-mode
    elpy
    cpputils-cmake
    ruby-mode
    nodejs-repl

    ))

(defun has-package-not-installed ()
  (loop for p in packages-list
	when (not (package-installed-p p)) do (return t)
	finally (return nil)))

(when (has-package-not-installed)
  ;; Check for new packages (package versions)
  (message "%s" "Get latest versions of all packages...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; Install the missing packages
  (dolist (p packages-list)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'init-package)
