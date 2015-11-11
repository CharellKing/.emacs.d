(require 'vimish-fold)

(vimish-fold-global-mode 1)

(global-set-key (kbd "C-x +") 'vimish-fold)
(global-set-key (kbd "C-x -") 'vimish-fold-delete)

(provide 'init-fold)
