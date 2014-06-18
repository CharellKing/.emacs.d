(require 'org2blog-autoloads)

(setq org2blog/wp-blog-alist
      `(("abc"
         :url "http://www.cnblogs.com/wind-qu/services/metaweblog.aspx"
         :username "CharellkingQu"
         :password "T9gV*|7$8L`l>h^x"
         :keep-new-lines t
         :confirm t
         :wp-code nil
         :tags-as-categories nil)
        ))

(setq org2blog/wp-buffer-template
  "#+DATE: %s
#+OPTIONS: toc:nil num:nil todo:nil pri:nil tags:nil ^:nil TeX:nil
#+CATEGORY: Heart
#+TAGS:
#+PERMALINK:
#+TITLE:
#+OPTIONS: ^:{}
\n")

(setq org-export-copy-to-kill-ring nil)

(provide 'init-org2blog)
