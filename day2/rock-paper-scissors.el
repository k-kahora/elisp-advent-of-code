;; Alist of points

(setq points '((X . 1) (Y . 2) (Z . 3)))
;; Make a list of a bunch of lists
;; eg. ((A X) (B Y) (C Z))
(progn (insert-file-contents "input")
			 (insert "((")
			 (while (re-search-forward "^" nil t)
			   (replace-match ")(") nil nil)
		  (end-of-buffer)
			 (insert "))"))
