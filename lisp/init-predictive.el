(add-to-list 'load-path "~/.emacs.d/predictive")
(autoload 'predictive-mode "predictive" "predictive" t)
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-main-dict 'rpg-dictionary
      predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
      predictive-which-dict t)

;; Use space and punctuation to accept the current the most likely completion.
(setq auto-completion-syntax-alist (quote (global accept . word)))

;; Avoid completion for short trivial words.
(setq auto-completion-min-chars (quote (global . 2)))

(provide 'init-predictive)
