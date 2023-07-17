
(let* ((sack (with-temp-buffer (progn
  (insert-file-contents "input")
  (insert "((")
  ;; Line number mod 3 true will give us aech group as a group of three
    (while (progn
	     (when (= (% (1- (line-number-at-pos)) 3) 0)
	       (insert ")(")
	       )
	     (forward-line 1)
	     (not (looking-at "^$"))))
    ;; (when (= (% (line-number-at-pos) 3) 0)
  (end-of-buffer)
  (insert "))")
  (goto-char 0)
  (read (current-buffer))
  ))))

  (mapcar (lambda (item)
	    (message ">>%s" item)) sack)
  )
