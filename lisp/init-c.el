(require 'company)
(require 'cedet)
(require 'cc-mode)
(require 'semantic)
(require 'function-args)
(require 'clean-aindent-mode)
(require 'dtrt-indent)
(require 'ws-butler)


(add-hook 'after-init-hook 'global-company-mode)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

(fa-config-default)
;; (define-key c-mode-map  [(contrl tab)] 'moo-complete)
;; ;;(define-key c++-mode-map  [(control tab)] 'moo-complete)
;; (define-key c-mode-map (kbd "M-o")  'fa-show)
;; ;;(define-key c++-mode-map (kbd "M-o")  'fa-show)

(add-to-list 'company-backends 'company-c-headers)

(global-semantic-stickyfunc-mode 1)

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

(add-hook 'pro-mode-hook 'clean-aindent-mode)

(dtrt-indent-mode 1)

(add-hook 'c-mode-common-hook 'ws-butler-mode)

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

(setq gdb-many-windows t
      gdb-show-main t
      )


(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here

  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)                  ;; Default is 2
  (setq c-indent-level 4)                  ;; Default is 2

  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode t)  ; use spaces only if nil
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(provide 'init-c)
