(defun add (a b)
  (let ((x (+ a b)))
    (format t "The sum is ~a" x)
    x))

(defmacro let1 (var val &body body)
  `(let ((,var ,val))
     ,@body))


(defun add2 (a b)
   (let1 x (+ a b)
    (format t "The sum is ~a" x)
    x))

(defun my-length (lst)
  (labels ((f (lst acc)
	     (if lst
		 (f (cdr lst) (1+ acc))
		 acc)))
    (f lst 0)))

;;バグあり
(defmacro split (val yes no)
  `(if ,val
       (let ((head (car ,val))
	     (tail (cdr ,val)))
	 ,yes)
       ,no))

(defun my-length2 (lst)
  (labels ((f (lst acc)
	     (split lst
		    (f tail (1+ acc))
		    acc)))
    (f lst 0)))

(split (progn (princ "Lisp rocks!")
	      '(2 3))
       (format t "This can be split into ~a and ~a." head tail)
       (format t "This cannot be split."))

;; まだバグあり
(defmacro split (val yes no)
  `(let1 x ,val
     (if x
       (let ((head (car x))
	     (tail (cdr x)))
	 ,yes)
       ,no)))

(let1 x 100
  (split '(2 3)
	 (+ x head)
	 nil))

;; 完成
(defmacro split (val yes no)
  (let1 g (gensym)
    `(let1 ,g ,val
      (if ,g
	  (let ((head (car ,g))
		(tail (cdr ,g)))
	    ,yes)
	  ,no))))

(defun pairs (lst)
  (labels ((f (lst acc)
	     (split lst
		    (if tail
			(f (cdr tail) (cons (cons head (car tail)) acc))
			(reverse acc))
		    (reverse acc))))
    (f lst nil)))

(defmacro recurse (vars &body body)
  (let1 p (pairs vars)
    `(labels ((self ,(mapcar #'car p)
		,@body))
       (self ,@(mapcar #'cdr p)))))

(recurse (n 9)
  (fresh-line)
  (if (zerop n)
      (princ "lift-off!")
      (progn (princ n)
	     (self (1- n)))))

(defun my-length3 (lst)
  (recurse (lst lst
		acc 0)
    (split lst
	   (self tail (+1 acc))
	   acc)))
