(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


(require 'goto-chg)
(global-set-key (kbd "C-c g c") 'goto-last-change)
(global-set-key (kbd "C-c g r") 'goto-last-change-reverse)

;; 解决Ctrl＋Space的冲突
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(provide 'init-shortcut)
