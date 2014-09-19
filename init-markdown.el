(autoload 'markdown-mode "markdown-mode" "editing markdown" t)

(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode)
            auto-mode-alist))
(provide 'init-markdown)
