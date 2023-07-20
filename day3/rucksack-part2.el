
(defun lowercasep  (c) "is the char lowercase" (interactive) (and (wordp c) (= c (downcase c))))
(defun uppercasep  (c) "is the char lowercase" (interactive) (and (wordp c) (= c (upcase c))))
(defun wordp (c) (= ?w (char-syntax c)))

(defun get-points (c)
  (if (lowercasep c)
      (- c 96)
    (+ 27 (- c 65))
  ))
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
  ;; For eack elf group whe must loop through the group and find the common badge
  (cl-reduce #'+
  (mapcar (lambda (item)
	    (get-points (car item)))
  (cdr 
  (mapcar (lambda (elf-group)
	    (cl-intersection (append (symbol-name (nth 1 elf-group)) nil)
			     (cl-intersection (append (symbol-name (nth 2 elf-group)) nil) 
					      (cl-intersection (append (symbol-name (nth 0 elf-group)) nil) (append (symbol-name (nth 1 elf-group)) nil))))
	    )
	  sack)))))
  
(insert )
?n
?i
?l


  ;; (mapcar (lambda (item)
  ;; 	    (message ">>%s" item)) sack)
