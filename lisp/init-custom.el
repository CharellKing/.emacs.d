(when (display-graphic-p)
  ;;==============================================
  ;;全屏设置
  ;;==============================================

  ;;=============================================
  ;;设置linux属性
  ;;============================================
  (defun my-linux-fullscreen ()
    (interactive)
    (x-send-client-message
     nil 0 nil "_NET_WM_STATE" 32
     '(2 "_NET_WM_STATE_FULLSCREEN" 0))
    )

  (defun my-linux-font()
    (set-face-attribute 'default nil :font "DejaVu Sans Mono 12")
    (dolist (character '(han kana symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			character
			(font-spec :family "WenQuanYi Bitmap Song" :size 16)))
    )

  (defun my-linux-maximized ()
    (interactive)
    (x-send-client-message
     nil 0 nil "_NET_WM_STATE" 32
     '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
    (x-send-client-message
     nil 0 nil "_NET_WM_STATE" 32
     '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
    )

  (cond ((memq system-type '(darwin))
	       (progn
	        (setq ns-auto-hide-menu-bar t)
	        (set-frame-parameter nil 'fullscreen 'fullboth)))
        ((memq system-type '(gnu/linux))
	       (progn
	        (my-linux-font)
	        (my-linux-maximized) ;;启动emacs时窗口最大化
	        (global-set-key [f11] 'my-linux-fullscreen))) ;; 启动全屏的快捷键
  )

  ;;=============================================
  ;;去掉工具栏，菜单栏，滚动条
  ;;=============================================
  (defun my-beatiful-ui()
    (tool-bar-mode 0)
    (scroll-bar-mode 0)
    (menu-bar-mode 0)
    (setq frame-title-format "")
    (setq-default mode-line-format nil)
    )

  (my-beatiful-ui)


(require 'color-theme)
(color-theme-initialize)

(defun my:color_theme ()
  (if (display-graphic-p)
      (color-theme-molokai)
    (color-theme-molokai)
    ;; (color-theme-hober)
    ))

(my:color_theme)
;; (add-hook 'after-make-frame-functions
;; 	    (my:color_theme))

)

;;===============================================
;;设置光标
;;===============================================
(setq-default cursor-type 'bar)
(blink-cursor-mode nil)


;;===============================================
;;关闭启动画面
;;==============================================
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;;==========================================
;;显示行号
;;==========================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))
(require 'linum)
(global-linum-mode)
(column-number-mode)
(line-number-mode)

;;============================================
;;显示时间
;;============================================
(display-time-mode 1);;启用时间显示设置
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和时间
(setq display-time-format "%m月%d日 %H:%M %A")

;;============================================
;;备份
;;============================================
(setq
    backup-by-copying t ; 自动备份
    backup-directory-alist
    '(("." . "~/.emacs_bak")) ; 自动备份在目录"~/.emacs_bak"下
    delete-old-versions t ; 自动删除旧的备份文件
    kept-new-versions 6 ; 保留最近的6个备份文件
    kept-old-versions 2 ; 保留最早的2个备份文件
    version-control t) ; 多次备份

;;====================================================
;;禁止鼠标
;;====================================================
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))


;;=================================================
;;undo
;;=================================================
(global-set-key (kbd "C-z") 'undo)

;;=================================================
;;设置tab
;;=================================================
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(global-set-key (kbd "RET") 'newline-and-indent)

(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "light sky blue")
(set-face-background 'highlight-indentation-current-column-face "medium aquamarine")
(setq highlight-indentation-offset 4)


;;=================================================
;;auto indent in region
;;=================================================
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)


;;=================================================
;;line
;;=================================================
(setq default-truncate-lines t)
(setq truncate-partial-width-windows nil)
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)


;;================================================
;;text decoration
;;================================================
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

;;=================================================
;;设置默认工作目录
;;=================================================
(setq default-directory "~/.emacs.d/")

;;=================================================
;;开启debug调试
;;=================================================
(setq debug-on-error t)

;;=================================================
;;解决中文换行的问题
;;=================================================
(add-hook 'org-mode-hook '(lambda ()
                     (setq visual-line-fringe-indicators t)
                     (visual-line-mode)
                     (if visual-line-mode
                        (setq word-wrap nil))))

;;=============================
;;字符集
;;=============================
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;; (setq coding-system-for-read 'utf-8)
;;(setq coding-system-for-write 'utf-8)

;;================================
;;设置交互
;;================================
(fset 'yes-or-no-p 'y-or-n-p)

;;================================
;;设置fill-column
;;================================
(setq default-fill-column 120)

;;================================
;;代码折叠
;;================================
(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
         (1+ (current-column))))))

(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C--") 'toggle-selective-display)

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)

;;========================================
;;term tab problem
;;========================================
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))

;;========================================
;; multiple column edit
;;========================================

(define-key global-map (kbd "C-c ;") 'iedit-mode)


;;(require 'unicad)

;;========================================
;;powerline
;;========================================
(require 'powerline)
(powerline-default-theme)

;;========================================
;;margin
;;========================================
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(defun auto-fci-mode (&optional unused)
  (if (> (window-width) fci-rule-column)
      (fci-mode 1)
    (fci-mode 0))
)

(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)

;;==================================================
;;change buffer
;;==================================================
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;==================================================
;;ido for buffer switch
;;==================================================
(require 'ido)
(ido-mode t)


;;=============================================
;;spell
;;=============================================
(setq-default ispell-program-name "aspell")

;;============================================
;;highlight-current-line
;;============================================
(require 'highlight-current-line)
(global-hl-line-mode t)
(setq highlight-current-line-globally t)
(setq highlight-current-line-high-faces nil)
(setq highlight-current-line-whole-line nil)
(setq hl-line-face (quote highlight))

;;============================================
;; default split windows in horizon
;;============================================
(defun split-horizontally-not-vertically ()
  "If there's only one window (excluding any possibly active minibuffer), then
     split the current window horizontally."
  (interactive)
  (if (= (length (window-list nil 'dont-include-minibuffer-even-if-active)) 1)
      (split-window-horizontally)))
(add-hook 'temp-buffer-setup-hook 'split-horizontally-not-vertically)

;;============================================
;;markset
;;============================================
(global-unset-key [?\C- ])
(define-key global-map [C-return] 'set-mark-command)

;;============================================
;;保存桌面
;;============================================
(desktop-save-mode 1)


(provide 'init-custom)
