(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


(require 'goto-chg)
(global-set-key (kbd "C-c g c") 'goto-last-change)
(global-set-key (kbd "C-c g r") 'goto-last-change-reverse)

(provide 'init-shortcut)
