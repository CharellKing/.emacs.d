(require 'cpputils-cmake)
	  
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (if (derived-mode-p 'c-mode 'c++-mode)
		(cppcm-reload-all)
	      )))
;; OPTIONAL, somebody reported that they can use this package with Fortran
(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
;; OPTIONAL, avoid typing full path when starting gdb
(global-set-key (kbd "C-c C-g")
		'(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
;; OPTIONAL, some users need specify extra flags forwarded to compiler
(setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))



(add-hook 'c-mode-common-hook
	  (lambda ()
	    (if (derived-mode-p 'c-mode 'c++-mode)
		(if  (not (or (string-match "^/usr/local/include/.*" buffer-file-name)
			      (string-match "^/usr/src/linux/include/.*" buffer-file-name)))
		    (cppcm-reload-all))
	      )))


(setq cppcm-get-executable-full-path-callback
      (lambda (path type tgt-name)
	;; path is the supposed-to-be target's full path
	;; type is either add_executabe or add_library
	;; tgt-name is the target to built. The target's file extension is stripped
	(message "cppcm-get-executable-full-path-callback called => %s %s %s" path type tgt-name)
	(let ((dir (file-name-directory path))
	      (file (file-name-nondirectory path)))
	  (cond
	   ((string= type "add_executable")
	    (setq path (concat dir "bin/" file)))
	   ;; for add_library
	   (t (setq path (concat dir "lib/" file)))
	   ))
	;; return the new path
	(message "cppcm-get-executable-full-path-callback called => path=%s" path)
	path))

(setq cppcm-write-flymake-makefile nil)




;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-hook 'php-mode-hook (lambda() (company-mode)))
;; (add-hook 'js-mode (lambda() (company-mode)))
;; (add-hook 'python-mode (lambda() (company-mode)))
;; (add-hook 'json-mode (lambda() (company-mode)))
;; (add-hook 'web-mode (lambda() (company-mode)))
;; (add-hook 'protobuf-mode (lambda() (company-mode)))
;; (add-hook 'emacs-lisp-mode (lambda() (company-mode)))
;; (add-hook 'markdown-mode (lambda() (company-mode)))

(provide 'init-c)
