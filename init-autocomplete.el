;;===========================================
;;auto-complete
;;===========================================
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;;===========================================
;;yasnippet
;;===========================================
(require 'yasnippet)
(yas-global-mode 1)

;;===========================================
;;brackets autopair
;;===========================================
;; (require 'autopair)
;; (autopair-global-mode)
;;(add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))
(require 'electric)
(electric-pair-mode t)

(provide 'init-autocomplete)
