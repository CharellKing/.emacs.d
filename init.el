
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;Base
(require 'init-package)
(require 'init-smex)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-ido)
(require 'init-window-numbering)
(require 'init-shortcut)
(require 'init-custom)
(require 'init-paredit)
(require 'init-fold)
(require 'init-projectile)
(require 'init-rss)

;; IDE
(require 'init-web)
(require 'init-python)
;;(require 'init-protobuf)
(require 'init-php)
(require 'init-c)
(require 'init-markdown)
(require 'init-template)
(require 'init-sh)
(require 'init-company)
(require 'init-lisp)
(require 'init-js)
(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nodejs-repl cpputils-cmake elpy php-mode protobuf-mode web-mode flymake-jslint json-mode js2-mode markdown-mode paredit flymake-shell slime-company company-jedi company-web company elfeed-goodies elfeed-org elfeed xclip highlight-indentation flx-ido projectile vimish-fold yasnippet window-numbering weechat web-beautify vlf smex smartparens slime psvn magit helm goto-chg emamux))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
