(require 'auctex)
(require 'preview-latex)

;;========================================
;;latex custom
;;=======================================
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;chinese is more surported
(setq Tex-engine 'xelatex)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;========================================
;;pdf-latex
;;========================================
(setq Tex-PDF-mode t)

(provice 'init-latex)
