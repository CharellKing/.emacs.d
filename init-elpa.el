(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("elpa" . "http://tromey.com/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)


(require 'cl)
(defvar packages-list
  '(
    ;;base
    highlight-current-line
    font-lock+
    color-theme
    session
    smex
    powerline
    autoinsert
    highlight-parentheses
    fill-column-indicator
    autopair
    goto-chg

    ;;autocomplete
    auto-complete
    yasnippet

    ;;C/C++
    auto-complete-c-headers
    flymake-google-cpplint
    google-c-style
    cpputils-cmake
    cmake-mode

    ;;dot
    graphviz-dot-mode

    ;;org
    org2blog

    ;;evernote
    evernote-mode

    ;;project
    xcscope
    flymake-shell
    projectile
    magit
    flymake-cursor
    flycheck


    ;;python
    deferred
    jedi
    epc
    python-mode
    python-pylint
    python-pep8
    ipython

    ;;latex
    auctex
    cdlatex
    auto-complete-auctex

    ;;markdown
    markdown-mode

    ;;js
    js2-mode

    ;;svn
    dsvn

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

(provide 'init-elpa)
