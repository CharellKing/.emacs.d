
(require 'vlf-setup)
(custom-set-variables
 '(vlf-application 'dont-ask))

(eval-after-load "vlf"
  '(define-key vlf-prefix-map "\C-xv" vlf-mode-map))

(provide 'init-file)
