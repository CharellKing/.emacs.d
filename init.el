
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;Base
(require 'init-package)
(require 'init-smex)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-ido)
(require 'init-window-numbering)
(require 'init-shortcut)
(require 'init-custom)
(require 'init-paredit)
(require 'init-fold)
(require 'init-projectile)
(require 'init-rss)

;; IDE
(require 'init-web)
(require 'init-python)
;;(require 'init-protobuf)
(require 'init-php)
(require 'init-c)
(require 'init-markdown)
(require 'init-template)
(require 'init-sh)
(require 'init-company)
(require 'init-lisp)
(require 'init-js)

(provide 'init)
