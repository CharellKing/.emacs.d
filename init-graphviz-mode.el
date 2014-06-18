;;C-cc快速编译
;;C-cp 预览图片
(require 'graphviz-dot-mode)

;;解决base-auto-pair没定义的问题 
(set-default 'autopair-dont-activate #'(lambda () (eq major-mode 'graphviz-dot-mode)))

(add-hook 'find-file-hook (lambda()
                            (if (string= "dot" (file-name-extension
                                                buffer-file-name))
                                (progn
                                  (message "Enabling Setings for dot-mode")
                                  (setq fill-column 1000)
                                  (base-auto-pair)
                                  (local-set-key (kbd "<C-f6>") 'compile)
                                  )
                              )))

(add-hook 'graphviz-dot-mode 
	  '(lambda()
	     (set tab-width 4)
	     (setq indent-tabs-mode t)
))

(provide 'init-graphviz-mode)
