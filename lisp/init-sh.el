(require 'flymake-shell)

(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")

(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)
(add-hook 'shell-command-complete-functions
          'bash-completion-dynamic-complete)

(add-hook 'sh-mode-hook 'flymake-shell-load)

(provide 'init-sh)
