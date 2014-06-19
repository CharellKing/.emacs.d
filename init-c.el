;;===========================================
;;header auto-complete
;;=========================================
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '(("/usr/include/c++/4.6")
                                             ("/usr/include/x86_64-linux-gnu/c++/4.6")
                                             ("/usr/include/c++/4.6/backward")
                                             ("/usr/lib/gcc/x86_64-linux-gnu/4.6/include")
                                             ("/usr/local/include")
                                             ("/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed")
                                             ("/usr/include"))))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;==========================================
;;google cpplint
;;==========================================
(defun my:flymake-google-init()
  (require 'flymake-google-cpplint)
  (global-set-key (kbd "RET") 'newline-and-indent)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load))
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)


(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;;=========================================
;;cedet
;;=========================================
;; (semantic-mode 1)
;; (defun my:add-semantic-to-autocomplete()
;;   (add-to-list 'ac-sources 'ac-source-semantic))
;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; (global-ede-mode 1)
;; ;;(ede-cpp-root-project "TimePass" :include-path)
;; (global-semantic-idle-scheduler-mode 1)

;;==============================================
;;clang
;;==============================================
(setenv "LD_LIBRARY_PATH" "/usr/lib/llvm-3.3/lib/")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/irony-mode/elisp/"))
(require 'irony)
(irony-enable 'ac)
(defun my:irony-enable()
  (when (member major-mode irony-known-modes)
    (irony-mode 1)))
(add-hook 'c++-mode-hook 'my:irony-enable)
(add-hook 'c-mode-hook 'my:irony-enable)


(provide 'init-c)
