(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("elpa" . "http://tromey.com/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)


(require 'cl)
(defvar packages-list
  '(font-lock+
    auto-complete
    yasnippet
    auto-complete-c-headers
    flymake-google-cpplint
    google-c-style
    color-theme
    session
    smex
    powerline
    autoinsert
    highlight-parentheses
    xcscope
    flymake-shell
    graphviz-dot-mode
    projectile
    cpputils-cmake
    cmake-mode
    org2blog
    magit
    fill-column-indicator
    evernote-mode
    ;;python
    deferred
    jedi
    epc
    python-mode
    python-pylint
    python-pep8
    ipython
    flycheck
    pydoc-info

    autopair
    goto-chg
    flymake-cursor
    highlight-current-line))

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
