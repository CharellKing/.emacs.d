(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup
 '(inferior-slime
   slime-asdf
   slime-autodoc
   slime-banner
   slime-c-p-c
   slime-editing-commands
   slime-fancy-inspector
   slime-fancy
   slime-fuzzy
   slime-highlight-edits
   slime-parse
   slime-presentation-streams
   slime-presentations
   slime-references
   slime-scratch
   slime-tramp
   slime-typeout-frame
   slime-xref-browser))

(provide 'init-lisp)
