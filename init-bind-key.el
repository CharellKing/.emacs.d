;;===================================
;;man
;;===================================
(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

;;===================================
;;f3为查找字符串,alt+f3关闭当前缓冲区
;;===================================
(global-set-key [f3] 'grep-find)
(global-set-key [M-f3] 'kill-this-buffer)

;;==================================
;;shift + f3 speedbar
;;==================================
(global-set-key [S-f3] 'speedbar-get-focus)

;;==================================
;;ctrl + f4    激活ecb
;;shift + f4   隐藏ecb
;;f4           显示ecb
;;==================================
;;(global-set-key [C-f4] 'ecb-activate)
;;(global-set-key [S-f4] 'ecb-hide-ecb-windows)
;;(global-set-key [f4] 'ecb-show-ecb-windows)
;;在init-ecb.el里面

;;==================================
;;gdb调试
;;==================================
(global-set-key [f5] 'gdb)

;;==================================
;;ctrl + F6  编译
;;f6         保存并且编译
;;==================================

(defun onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
  
(setq-default compile-command "make")    
(global-set-key [C-f6] 'compile)
(global-set-key [f6] 'onekey-compile)

;;============================================
;;f7          打开一个分屏竖向的shell buffer
;;ctrl + f7   打开一个shell buffer
;;shift + f7  清空buffer
;;===========================================
(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))


(defun my-eshell-clear-buffer ()
  "Eshell clear buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))

(global-set-key [f7] 'open-eshell-other-buffer)
(global-set-key [C-f7] 'eshell)
(global-set-key [S-f7] 'my-eshell-clear-buffer)

;;===========================================
;;ctrl + f9  dired
;;f9         切换到其他窗口
;;===========================================
(global-set-key [C-f9] 'dired)
(global-set-key [f9] 'other-window);f9在其他窗口之间旋转

;;===========================================
;;f10       撤销
;;===========================================
(global-set-key [C-f10] 'undo)

;;===========================================
;;ctrl + f12   查看日程
;;f12          函数跳转
;;shift + 12   函数跳转回去
;;==========================================
(global-set-key [C-f12] 'list-bookmarks)
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq frist (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;=======================================
;;切换ecb窗口
;;=======================================
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;======================================
;;窗口关闭
;;======================================
;;切换到其他窗口，alt+0
(global-set-key (kbd "M-0") 'other-window)

;;关闭其他窗口,alt+1
(global-set-key (kbd "M-1") 'delete-other-windows)

;;水平分割窗口,alt+2
(global-set-key (kbd "M-2") 'split-window-vertically)

;;垂直分割窗口,alt+3
(global-set-key (kbd "M-3") 'split-window-horizontally)

;;关闭当前窗口,alt+4
(global-set-key (kbd "M-4") 'delete-window)
;;(global-set-key (kbd "M-4") 'kill-this-buffer)

;;显示缓冲区完整名称
(global-set-key (kbd "M-5") 'display-buffer-name)

(provide 'init-bind-key)