(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


(require 'goto-chg)
(global-set-key (kbd "C-c g c") 'goto-last-change)
(global-set-key (kbd "C-c g r") 'goto-last-change-reverse)

;; 隐藏代码快捷键
(global-set-key (kbd "C-c [") 'hs-hide-block)
(global-set-key (kbd "C-c ]") 'hs-show-block)
(global-set-key (kbd "C-c {") 'hs-hide-all)
(global-set-key (kbd "C-c }") 'hs-show-all)


;; 修改undo的快捷键
(global-set-key (kbd "C-/") 'undo)



;; 解决Ctrl＋Space的冲突
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-unset-key (kbd "C-z"))

(provide 'init-shortcut)
