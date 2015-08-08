(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;base
(require 'init-package)
(require 'init-smex)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-ido)
(require 'init-autopair)
(require 'init-window-numbering)
(require 'init-shortcut)

;; ide
(require 'init-web)
(require 'init-python)
(require 'init-protobuf)
(require 'init-php)
(require 'init-custom)
(require 'init-c)
(require 'init-markdown)
(require 'init-template)

(require 'init-company)

(provide 'init)
