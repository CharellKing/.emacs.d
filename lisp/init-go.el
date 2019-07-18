
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))


(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-g") 'go-goto-imports)))


(add-hook 'go-mode-hook '(lambda ()
                           (local-set-key (kbd "C-c C-k") 'godoc)))


(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)))


(defun go-mode-setup ()
  (go-eldoc-setup))

(add-hook 'go-mode-hook 'go-mode-setup)

(provide 'init-go)
