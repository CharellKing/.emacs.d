;; 加载桌面
(desktop-save-mode 1)

(when (require 'session nil t)
  (add-hook 'after-init-hook 'session-initialize)
  (add-to-list 'session-globals-exclude 'org-mark-ring))

;;expanded folded secitons as required
(defun le::maybe-reveal ()
  (when (and (or (memq major-mode  '(org-mode outline-mode))
                 (and (boundp 'outline-minor-mode)
                      outline-minor-mode))
             (outline-invisible-p))
    (if (eq major-mode 'org-mode)
        (org-reveal)
      (show-subtree))))

(add-hook 'session-after-jump-to-last-change-hook
          'le::maybe-reveal)

;;; Local session.
(unless (daemonp)
  (custom-set-variables '(session-save-file ".emacs.session"))

  (let ((local-session (concat default-directory session-save-file)))
    (if (file-exists-p local-session)
        (progn
          (custom-set-variables '(session-save-file local-session))
          (message (concat "Local session file set to \"" session-save-file "\".")))
      (custom-set-variables '(session-save-file (concat "~/" session-save-file))))))


(provide 'init-session)
