(require 'company)
(require 'company-jedi)
(require 'company-web-html)
(require 'company-web-jade)
(require 'company-web-slim)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-tooltip-limit 20)                      
(setq company-tooltip-align-annotations 't)          
(setq company-idle-delay .3)                         
(setq company-begin-commands '(self-insert-command)) 
(global-set-key (kbd "C-c /") 'company-files)


;;python
(add-hook 'python-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-jedi)))

;;common lisp
(slime-setup '(slime-company))

;;web
(add-hook 'web-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-web-html))
                          (company-mode t)))


(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(provide 'init-company)
