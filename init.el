(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'init-elpa)
(require 'init-custom)
(require 'init-session)
(require 'init-smex)
(require 'init-autoinsert)

(require 'init-cmake)
(require 'init-flymake)
(require 'init-autocomplete)
(require 'init-c)
(require 'init-ggtags)
(require 'init-python)
(require 'init-protobuf)

(require 'init-xcscope)
(require 'init-elisp)
(require 'init-lua-mode)
(require 'init-sh)
(require 'init-graphviz-mode)
(require 'init-latex)
(require 'init-markdown)
(require 'init-predictive)
(require 'init-js)
(require 'init-template)

(require 'init-projectile)
(require 'init-doxymacs)
(require 'init-git)
(require 'init-web)

(require 'init-shortcut)

(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "e4e97731f52a5237f37ceb2423cb327778c7d3af7dc831788473d4a76bcc9760" default)))
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(magit-use-overlays nil)
 '(py-shell-switch-buffers-on-execute nil)
 '(session-save-file (concat "~/" session-save-file))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
