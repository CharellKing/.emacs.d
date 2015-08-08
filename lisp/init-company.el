(require 'company)
(require 'company-jedi)
(require 'company-web-html)
(require 'company-web-jade)
(require 'company-web-slim)

(add-hook 'python-mode-hook
	  (lambda ()
	    (add-to-list 'company-backends 'company-jedi)))

(slime-setup '(slime-company))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
