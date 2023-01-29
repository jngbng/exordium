;; show buffer-file-name in *message*
(defun jbseo/show-file-name ()
   "Show the full path file name in the minibuffer."
     (interactive)
       (message (buffer-file-name)))

(defun jbseo/copy-full-path-to-kill-ring ()
   "copy buffer's full path to kill ring"
     (interactive)
       (when buffer-file-name
            (kill-new (file-truename buffer-file-name))))

;; vi path +lineno 할 때 편함.
(defun jbseo/copy-full-path-linum ()
   "copy buffer's full path to kill ring"
     (interactive)
       (when buffer-file-name
            (kill-new (concat (file-truename buffer-file-name) " +" (number-to-string (line-number-at-pos))))))

;;; https://www.emacswiki.org/emacs/KillMatchingLines#:~:text=The%20command%20'M%2Dx%20kill%2Dmatching,to%20your%20InitFile%20for%20Emacs.
(defun jbseo/kill-matching-lines (regexp &optional rstart rend interactive)
  "Kill lines containing matches for REGEXP.

See `flush-lines' or `keep-lines' for behavior of this command.

If the buffer is read-only, Emacs will beep and refrain from deleting
the line, but put the line in the kill ring anyway.  This means that
you can use this command to copy text from a read-only buffer.
\(If the variable `kill-read-only-ok' is non-nil, then this won't
even beep.)"
  (interactive
   (keep-lines-read-args "Kill lines containing match for regexp"))
  (let ((buffer-file-name nil)) ;; HACK for `clone-buffer'
    (with-current-buffer (clone-buffer nil nil)
      (let ((inhibit-read-only t))
        (keep-lines regexp rstart rend interactive)
        (kill-region (or rstart (line-beginning-position))
                     (or rend (point-max))))
      (kill-buffer)))
  (unless (and buffer-read-only kill-read-only-ok)
    ;; Delete lines or make the "Buffer is read-only" error.
    (flush-lines regexp rstart rend interactive)))

;;; https://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/
(defun jbseo/delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(provide 'init-jbseo)
