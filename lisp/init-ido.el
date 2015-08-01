(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".py" ".sh" ".json" ".el" ".h" ".c" ".cpp" ".java" ".php"))

(provide 'init-ido)
