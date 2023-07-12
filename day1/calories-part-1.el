(let ((bags 
(with-temp-buffer
  (progn (insert-file-contents "input" nil nil nil)
	 (insert "((")
	 (while (re-search-forward "^$" nil t)
	   (replace-match ")(" nil nil))
	 (end-of-buffer)
	 (insert "))")
	 (goto-char (point-min))
	 (read (current-buffer))
   ))))
  (cl-reduce #'+ (seq-take
  (sort 
  (mapcar (lambda (bag)
	    (cl-reduce #'+ bag))
	  bags) #'> ) 3)))

(let (
      (bags
(progn
  (setq x '( (312 3210) (4321 31)))
  (list x)
  )))
  (mapcar (lambda (item) (car item)) bags)
  )





