
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
  (insert "(")
  (end-of-buffer)
  (insert ")")
  (goto-char 0)
  (read (current-buffer))
  ))))
  (cl-reduce #'+
  (mapcar (lambda (list)
	    ;; Here we must take the list and do string manupulation and return the priority of the rucksack
	    (let ((res 0)(letters (make-hash-table :test 'equal)))
	      (dotimes (i (length (car list)))
		(puthash (aref (car list) i) t letters)
		)
	      (dotimes (i (length (car (cdr list))))
		(when
		(gethash (aref (car (cdr list)) i) letters)
		    (setq res (aref (car (cdr list)) i))
		)
		)
	      (get-points res))
	    )
  (mapcar (lambda (item)
	    (let* ((item-str (symbol-name item))
		   (first-half (substring item-str 0 (/ (length item-str) 2)))
		   (second-half (substring item-str (/ (length item-str) 2) (length item-str))))
	      (list first-half second-half)))
	  sack))))




