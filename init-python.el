;;==============================================
;;python-mode
;;==============================================
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\.py\'" . python-mode))

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

;;=============================================
;;ipython
;;=============================================
(require 'ipython)
(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
;; never swich to shell when interpreting
(custom-set-variables
 '(py-shell-switch-buffers-on-execute nil))

;;=============================================
;;check syntax
;;=============================================
(require 'python-pep8)
(require 'python-pylint)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;==============================================
;; jedi
;;==============================================
(require 'jedi)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t);

;;==============================================
;;shortcuts
;;==============================================
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c p p") 'pylint)
            (local-set-key (kbd "C-c p 8") 'pep8)
            (local-set-key (kbd "C-c p i") 'ipython)
        ))





(provide 'init-python)
