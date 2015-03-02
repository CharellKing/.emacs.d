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
(require 'autopair)

(defvar autopair-modes '(r-mode ruby-mode))
(defun turn-on-autopair-mode() (autopair-mode 1))
(dolist (mode autopair-modes)(add-hook (intern (concat(symbol-name mode) "-hook")) 'turn-on-autopair-mode))

(require 'paredit)
(defadvice paredit-mode (around disable-autopairs-around (arg))
  "Disable autopairs mode if paredit-mode is turned on"
  ad-do-it
  (if (null ad-return-value)
      (autopair-mode 1)
    (autopair-mode 0)
    ))

(ad-activate 'paredit-mode)

;; (autopair-global-mode)
;; (add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))

(provide 'init-autocomplete)
