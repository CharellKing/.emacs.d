(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'highlight-parentheses)

(add-hook 'c-mode-common-hook 'highlight-parentheses-mode)

(provide 'init-highlight-parentheses)
