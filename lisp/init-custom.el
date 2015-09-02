;; auto save
(load "desktop")
(require 'desktop)
(setq desktop-load-locked-desktop t)
(setq default-directory "~/")
(setq desktop-dirname "~/")
(setq desktop-base-file-name ".emacs-desktop")
(desktop-save-mode 1)

;; tab to space
(setq-default indent-tabs-mode nil)

;; 设定mac的剪切板
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))


(cond ((memq system-type '(darwin))
       (progn
	 (setq interprogram-cut-function 'paste-to-osx)
	 (setq interprogram-paste-function 'copy-from-osx))))


;; 字符集
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")

(defadvice shell (before advice-utf-shell activate)
  (set-default-coding-systems 'utf-8))
(ad-activate 'shell)


;; 缩进高亮
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; 在mode line上显示文件字符集
(defvar my-mode-line-coding-format
  '(:eval
    (let* ((code (symbol-name buffer-file-coding-system))
	   (eol-type (coding-system-eol-type buffer-file-coding-system))
	   (eol (if (eq 0 eol-type) "UNIX"
		  (if (eq 1 eol-type) "DOS"
		    (if (eq 2 eol-type) "MAC"
		      "???")))))
      (concat code " " eol " "))))
(put 'my-mode-line-coding-format 'risky-local-variable t)
(setq-default mode-line-format (substitute
                                'my-mode-line-coding-format
                                'mode-line-mule-info
                                mode-line-format))


;; 删除行尾空格
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; 括号自动完成
(electric-pair-mode 1)
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            ) )

(provide 'init-custom)
