(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(provide 'init-shortcut)
