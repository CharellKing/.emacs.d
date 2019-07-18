(require 'package)


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
    origami
    projectile
    flx-ido
    highlight-indentation
    fill-column-indicator
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
    auto-complete

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
    nodejs-repl
    undo-tree

    rhtml-mode
    yaml-mode
    ruby-mode
    psgml
    projectile-rails

    go-mode
    go-eldoc
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
