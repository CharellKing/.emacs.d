(require 'autopair)

(autopair-global-mode 1)

;; (defvar autopair-modes '(r-mode ruby-mode))
;; (defun turn-on-autopair-mode () (autopair-mode 1))
;; (dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))

;; (require 'paredit)
;; (defadvice paredit-mode (around disable-autopairs-around (arg))
;;   "Disable autopairs mode if paredit-mode is turned on"
;;   ad-do-it
;;   (if (null ad-return-value)
;;       (autopair-mode 1)
;;     (autopair-mode 0)
;;     ))

;; (ad-activate 'paredit-mode)


(add-hook 'c++-mode-hook
	  #'(lambda ()
	      (push ?{
		    (getf autopair-dont-pair :comment))))

(add-hook 'python-mode-hook
	  #'(lambda ()
	      (setq autopair-handle-action-fns
		    (list #'autopair-default-handle-action
			  #'autopair-python-triple-quote-action))))


(add-hook 'c++-mode-hook
	  #'(lambda ()
	      (push '(?< . ?>)
		    (getf autopair-extra-pairs :code))))

(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      (push '(?` . ?')
		    (getf autopair-extra-pairs :comment))
	      (push '(?` . ?')
		    (getf autopair-extra-pairs :string))))

(add-hook 'python-mode-hook
	  #'(lambda ()
	      (push '(?` . ?')
		    (getf autopair-extra-pairs :comment))
	      (push '(?` . ?')
		    (getf autopair-extra-pairs :string))))

(provide 'init-autopair)

