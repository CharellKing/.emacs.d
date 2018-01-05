(require 'vimish-fold)
(require 'origami)

;; =================================vimish==========================
(vimish-fold-global-mode 1)

(global-set-key (kbd "C-x +") 'vimish-fold)
(global-set-key (kbd "C-x -") 'vimish-fold-delete)


;; ================================origami==========================

(global-set-key (kbd "C-c TAB") 'origami-recursively-toggle-node)
(global-set-key (kbd "C-\\") 'origami-recursively-toggle-node)
(global-set-key (kbd "M-\\") 'origami-close-all-nodes)
(global-set-key (kbd "M-+") 'origami-open-all-nodes)

(global-origami-mode)

(provide 'init-fold)
