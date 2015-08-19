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

;; IDE
(require 'init-web)
(require 'init-python)
(require 'init-protobuf)
(require 'init-php)
(require 'init-c)
(require 'init-markdown)
(require 'init-template)
(require 'init-sh)
(require 'init-company)

(provide 'init)
