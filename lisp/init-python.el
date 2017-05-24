(defun my-python-mode-hook ()
  "Hooks for Web mode."
  (elpy-enable)
  (flycheck-mode)
  (elpy-use-ipython)

  (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
  (define-key global-map (kbd "C-c o") 'iedit-mode)

  (defun flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
)

(add-hook 'python-mode-hook  'my-python-mode-hook)


(provide 'init-python)
