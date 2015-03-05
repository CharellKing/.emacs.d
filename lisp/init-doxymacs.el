(add-to-list 'load-path "~/.emacs.d/doxymacs-1.8.0/lisp")
(require 'doxymacs) ;; 启动doxymacs  

;;===============================================
;;注释高亮，针对C和C++程序
;;===============================================
(defun my-doxymacs-font-lock-hook ()  
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))  
      (doxymacs-font-lock)))  
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)  
(doxymacs-mode);doxymacs-mode常true  
(add-hook 'c-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode  
(add-hook 'c++-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode  

(provide 'init-doxymacs)
