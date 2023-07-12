;; Alist of points
;; A is opponent rock and X is rock for me
;; B is opponent Paper and Y is paper for me
;; C is Scissors and Z is scissors

(setq points '((X . 1) (Y . 2) (Z . 3)))
(setq win-loss
      '(('(A X) . 3) ((A Y) . 6) ((A Z) . 0 )
	((B X) . 0) ((B Y) . 3) ((B Z) . 6)
	((C X) . 6) ((C Y) . 0) ((C Z) . 3)))
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
	    (+ (alist-get item win-loss 0 nil #'equal)
	       (alist-get (nth 1 item) points))
	    ) strategy)
  ))
