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
(require 'init-python)

(require 'init-xcscope)
(require 'init-elisp)
(require 'init-lua-mode)
(require 'init-sh)
(require 'init-graphviz-mode)
(require 'init-w3m)


(require 'init-projectile)
(require 'init-doxymacs)
(require 'init-org2blog)
(require 'init-git)
(require 'init-evernote)


(require 'init-shortcut)
(put 'set-goal-column 'disabled nil)
