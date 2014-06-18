(add-to-list 'load-path "~/.emacs.d/site-lisp/template")
(require 'template)

(setq template-default-directories (cons "~/.emacs.d/site-lisp/templates" template-default-directories))
      
;;(setq template-subdirectories '("~/.emacs.d/site-lisp/templates"))  
(setq template-auto-insert t)  
(template-initialize)  
(add-to-list 'template-find-file-commands  
             'ido-exit-minibuffer)

(provide 'init-template);
