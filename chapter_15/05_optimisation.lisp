(defparameter *foo* (lambda ()
		      5))

(defparameter *foo* (let ((x 5))
		      (lambda ()
			x)))

(let ((line-number 0))
  (defun my-print (x)
    (print line-number)
    (print x)
    (incf line-number)
    nil))


(defun my-length (lst)
  (if lst
      (1+ (my-length (cdr lst)))
      0))

(defparameter *biglist* (loop for i below 100000 collect 'x))

(defun my-length (lst)
  (labels ((f (lst acc)
	     (if lst
		 (f (cdr lst) (1+ acc))
		 acc)))
    (f lst 0)))

(compile 'my-length)
