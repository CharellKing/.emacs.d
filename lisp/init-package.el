(require 'package)

(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))


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
    highlight-indentation
    magit
    psvn
    package
    vlf
    

    company
    company-web
    company-jedi
    slime-company


 
    paredit
    markdown-mode
    js2-mode
    json-mode
    web-mode
    json-mode
    protobuf-mode
    php-mode
    elpy
    cpputils-cmake
    
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
