
(defun build-lowercase-word (letters building)
  (let (
	(letter (car letters))
	)
    (if (eq letter nil) building
      (let (
	    (lowercase (downcase letter))
	    )
    (build-lowercase-word (cdr letters) (-snoc building lowercase))
    ))))

(defun lowercase-word (word)
  (let ((word-list (string-to-list word)))
    (let (
	  (downcase-letters (build-lowercase-word word-list (list)))
	  )
      (apply #'string downcase-letters)
  )))

(defun lowercase-region (beg end)
 "Reverse characters between BEG and END."
 (interactive "r")
 (let ((region (buffer-substring beg end)))
   (delete-region beg end)
   (insert (lowercase-word region))))


