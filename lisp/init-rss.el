;; Load elfeed-org
(require 'elfeed-org)
(require 'elfeed)

(global-set-key (kbd "C-x w") 'elfeed)

(elfeed-org)

;; (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))

(setq-default elfeed-search-filter "@1-week-ago +unread ")

(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "2 weeks ago"
                              :remove 'unread))

(defun feed-reader/stats ()
  "Count the number of entries and feeds being currently displayed."
  (if (and elfeed-search-filter-active elfeed-search-filter-overflowing)
      (list 0 0 0)
    (cl-loop with feeds = (make-hash-table :test 'equal)
             for entry in elfeed-search-entries
             for feed = (elfeed-entry-feed entry)
             for url = (elfeed-feed-url feed)
             count entry into entry-count
             count (elfeed-tagged-p 'unread entry) into unread-count
             do (puthash url t feeds)
             finally
             (cl-return
              (list unread-count entry-count (hash-table-count feeds))))))

(defun feed-reader/search-header ()
  "Returns the string to be used as the Elfeed header."
  (let* ((separator-left (intern (format "powerline-%s-%s"
                                         (powerline-current-separator)
                                         (car powerline-default-separator-dir))))
         (separator-right (intern (format "powerline-%s-%s"
                                          (powerline-current-separator)
                                          (cdr powerline-default-separator-dir)))))
    (if (zerop (elfeed-db-last-update))
        (elfeed-search--intro-header)
      (let* ((db-time (seconds-to-time (elfeed-db-last-update)))
             (update (format-time-string "%Y-%m-%d %H:%M:%S %z" db-time))
             (stats (feed-reader/stats))
             (search-filter (cond
                             (elfeed-search-filter-active
                              "")
                             (elfeed-search-filter
                              elfeed-search-filter)
                             ("")))
             (lhs (list
                   (powerline-raw (concat search-filter " ") 'powerline-active1 'l)
                   (funcall separator-right 'powerline-active1 'mode-line)))
             (center (list
                      (funcall separator-left 'mode-line 'powerline-active2)
                      (destructuring-bind (unread entry-count feed-count) stats
                        (let* ((content (format " %d/%d:%d" unread entry-count feed-count))
                               (help-text nil)
                               )
                          (if url-queue
                              (let* ((total (length url-queue))
                                     (in-process (cl-count-if #'url-queue-buffer url-queue)))
                                (setf content (concat content " (*)"))
                                (setf help-text (format " %d feeds pending, %d in process ... "
                                                        total in-process))))
                          (propertize content
                                      'face 'powerline-active2
                                      'help-echo help-text)))
                      (funcall separator-right 'powerline-active2 'mode-line)))
             (rhs (list
                   (funcall separator-left 'mode-line 'powerline-active1)
                   (powerline-raw (concat " " update) 'powerline-active1 'r))))

        (concat (powerline-render lhs)
                (powerline-fill-center nil (/ (powerline-width center) 2.0))
                (powerline-render center)
                (powerline-fill nil (powerline-width rhs))
                (powerline-render rhs))))))

(defun popwin:elfeed-show-entry (buff)
  (popwin:popup-buffer buff
                       :position 'right
                       :width 0.5
                       :dedicated t
                       :noselect nil
                       :stick t))

(defun popwin:elfeed-kill-buffer ()
  (interactive)
  (let ((window (get-buffer-window (get-buffer "*elfeed-entry*"))))
    (kill-buffer (get-buffer "*elfeed-entry*"))
    (delete-window window)))

(setq elfeed-show-entry-switch #'popwin:elfeed-show-entry
      elfeed-show-entry-delete #'popwin:elfeed-kill-buffer
      elfeed-search-header-function #'feed-reader/search-header)

(provide 'init-rss)
