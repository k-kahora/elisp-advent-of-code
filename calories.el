
(with-temp-buffer 
  (insert-file-contents "input" t nil nil)
  (goto-char (point-min))
  (while (not (eobp))
    (let ((ln (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
      (message ">> %s" ln)
      (forward-line 1)
      )
    ))
