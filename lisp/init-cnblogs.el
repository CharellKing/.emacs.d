;; @see http://blog.nethazard.net/post-to-wordpress-blogs-with-emacs-org-mode/
(add-to-list 'load-path "~/.emacs.d/site-lisp/org2blog")
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/metaweblog")

(require 'org2blog-autoloads)
(require 'xml-rpc)
(require 'metaweblog)

;;=================================================================
;;设置blog
;;=================================================================
(setq org2blog/wp-blog-alist
      '(("cnblog"
         :url "http://www.cnblogs.com/atskyline/services/metaweblog.aspx"
         :username "CharellkingQu"
;;	 :password "xxxx"
	 :keep-new-lines t
	 :confirm t
	 :wp-code nil
         :tags-as-categories nil)
	)
)

;;===============================================================
;;博客模板
;;===============================================================
(setq org2blog/wp-buffer-template
      "-----------------------
#+TITLE: %s
#+DATE: %s
#+CATEGORY:%s


#+DESCRIPTION:%s
-----------------------\n")

(defun my-format-function (format-string)
   (format format-string
           org2blog/wp-default-title
           (format-time-string "%d-%m-%Y" (current-time))))

(setq org2blog/wp-buffer-format-function 'my-format-function)

(provide 'init-org2blog)
