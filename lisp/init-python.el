(elpy-enable)

(elpy-use-ipython)

(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)

(provide 'init-python)
