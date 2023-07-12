;; Alist of points
;; A is opponent rock and X is I need to lose
;; B is opponent Paper and Y means I need to draw
;; C is Scissors and Z means I need to win

(setq points '((R . 1) (P . 2) (S . 3)))
(setq method
      '(((A X) . S) ((A Y) . R) ((A Z) . P)
	((B X) . R) ((B Y) . P) ((B Z) . S)
	((C X) . P) ((C Y) . S) ((C Z) . R)))
(setq win-loss '((X . 0) (Y . 3) (Z . 6)))
;; Make a list of a bunch of lists
;; eg. ((A X) (B Y) (C Z))
(let ((strategy
(with-temp-buffer (progn (insert-file-contents "input")
			 (insert "((")
			 (while (re-search-forward "^" nil t)
			   (replace-match ")(") nil nil)
		  (end-of-buffer)
		  (insert "))")
		  (goto-char 0)
		  (read (current-buffer)))
		  )))
  (message "%s" strategy)
  (cl-reduce #'+
  (mapcar (lambda (item)
	    ;; First look up the move using the correct method
	    ;; Then do the appropiate math
	    (let ((choice
		   (alist-get item method 0 nil #'equal)
		   ))
	      (progn 
	    (+ (alist-get choice points 0 nil #'equal)
		  (alist-get (nth 1 item) win-loss 0 nil #'equal))
	    )
	      ))
	     strategy))
  )
