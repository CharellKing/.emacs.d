(require 'template)

(setq template-default-directories (cons "~/.emacs.d/templates" template-default-directories))

;;(setq template-subdirectories '("~/.emacs.d/templates"))
(setq template-auto-insert t)
(template-initialize)
(add-to-list 'template-find-file-commands
             'ido-exit-minibuffer)

(provide 'init-template)
