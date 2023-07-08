
(with-temp-buffer 
  (insert-file-contents "input" t nil nil)
  (goto-char (point-min))
  (setq sum 0)
  (while (not (eobp))
    (let ((ln (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
	  )
      (setq sum (+ sum (string-to-number ln)))
      (forward-line 1)
      )
    )
  (message "the sum is %s" sum))
