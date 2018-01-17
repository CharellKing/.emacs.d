(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; 遇到相似的文件c-j就可以创建要生成的文件
(global-set-key (kbd "C-x C-f") 'ido-find-file) 

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; (setq ido-create-new-buffer 'always)
;; (setq ido-file-extensions-order '(".py" ".sh" ".json" ".el" ".h" ".c" ".cpp" ".java" ".php"))

(provide 'init-ido)
