(require 'autoinsert)

(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates")
(setq auto-insert-query nil)
(define-auto-insert "\.py" "my-python-template.py")
(define-auto-insert "\.c" "my-c-template.py")
(define-auto-insert "\.cpp" "my-cpp-template.cpp")
(define-auto-insert "\.h" "my-h-template.h")
(define-auto-insert "\.java" "my-java-template.java")

(provide 'init-autoinsert)
