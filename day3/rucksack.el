(let* ((sack (with-temp-buffer (progn
  (insert-file-contents "input")
  (insert "(")
  (end-of-buffer)
  (insert ")")
  (goto-char 0)
  (read (current-buffer))
  ))))
  (mapcar (lambda (item)
	    (let* ((item-str (symbol-name item))
		   (first-half (substring item-str 0 (/ (length item-str) 2)))
		   (second-half (substring item-str (/ (length item-str) 2) (length item-str))))
	      (list first-half second-half)))
	      sack))
  

