(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'init-go)
