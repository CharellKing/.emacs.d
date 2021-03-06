
(defvar code-editing-mode-hooks '(c-mode-common-hook
                                  clojure-mode-hook
                                  java-mode-hook
                                  lisp-mode-hook
                                  emacs-lisp-mode-hook
                                  php-mode-hook
                                  perl-mode-hook
                                  python-mode-hook
                                  sh-mode-hook))


(dolist (mode code-editing-mode-hooks)
  (add-hook mode 'projectile-mode))

(setq projectile-enable-caching t)

(provide 'init-projectile)
