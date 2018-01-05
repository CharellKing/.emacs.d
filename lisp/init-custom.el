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


(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(cond ((memq system-type '(darwin))
       (progn
         (set-exec-path-from-shell-PATH)
         (setq interprogram-cut-function 'paste-to-osx)
         (setq interprogram-paste-function 'copy-from-osx))))

(cond ((memq system-type '(gnu/linux))
       (progn
         (xclip-mode 1))))
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
(set-face-background 'highlight-indentation-face "#FFB6C1")
(set-face-background 'highlight-indentation-current-column-face "#6A5ACD")


;; 设置行号
(defun fix-linum-size ()
  (interactive)
  (set-face-attribute 'linum nil :height 140)
  (set-face-attribute 'linum nil :foreground "yellow"))

(add-hook 'linum-mode-hook 'fix-linum-size)

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

;; 取消wrap line的\
(set-display-table-slot standard-display-table 'wrap ?\ )


;; 列显示
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq-default fci-rule-column 120)

;;设置TAB宽度为4
(setq default-tab-width 4)
;;以下设置缩进
;;用tab缩进
(setq indent-tabs-mode t)
(setq c-indent-level 4)
(setq c-continued-statement-offset 4)
(setq c-brace-offset -4)
(setq c-argdecl-indent 4)
(setq c-label-offset -4)
(setq c-basic-offset 4)
(global-set-key "\C-m" 'reindent-then-newline-and-indent)


;; toolbar menu
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(defvar code-editing-mode-hooks '(c-mode-common-hook
                                  clojure-mode-hook
                                  java-mode-hook
                                  lisp-mode-hook
                                  emacs-lisp-mode-hook
                                  php-mode-hook
                                  web-mode-hook
                                  perl-mode-hook
                                  python-mode-hook
                                  sh-mode-hook))

;; cpp style
(setq c-default-style "linux"
      c-basic-offset 4)

;; show function name in head line
(which-function-mode)

(setq mode-line-format (delete (assoc 'which-func-mode
                                      mode-line-format) mode-line-format)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))

(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-format (delete (assoc 'which-func-mode
                                          mode-line-format) mode-line-format)
          header-line-format which-func-header-line-format)))


(dolist (mode code-editing-mode-hooks)
  (add-hook mode 'fci-mode))


(require 'powerline)
(powerline-default-theme)

(require 'popwin)
(popwin-mode 1)

(provide 'init-custom)
