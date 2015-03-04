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
(require 'highlight-parentheses)
(require 'autopair)

(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
                    (if autopair-handle-action-fns
                        autopair-handle-action-fns
                      '(autopair-default-handle-action))
                    '((lambda (action pair pos-before)
                        (hl-paren-color-update)))))))

(global-highlight-parentheses-mode t)


(setq hl-paren-colors
      '("red1" "orange1" "yellow1" "green1" "cyan1"
        "slateblue1" "magenta1" "purple"))

(paredit-mode t)
(electric-pair-mode 1)

(provide 'init-autocomplete)
