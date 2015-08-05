
;;auto save
(desktop-save-mode 1)


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


;;字符集
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system
      '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'utf-8)


;;缩进高亮
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

(provide 'init-custom)
