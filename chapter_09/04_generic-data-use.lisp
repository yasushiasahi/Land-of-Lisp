(length '(a b c))
(length "blue")
(length (make-array 5))

(list-length '(a b c))

(find-if #'numberp '(a b 5 p))

(count #\s "mississippi")

(position #\4 "2kewl4hfie")

(some #'numberp '(a b 5 d))

(every #'numberp '(a b 5 d))


(reduce #'+ '(3 4 6 5 2))
(apply #'+ '(3 4 6 5 2))

(reduce (lambda (best item)
	  (if (and (evenp item) (> item best))
	      item
	      best))
	'(7 4 6 5 2)
	:initial-value 0)

(reduce (lambda (best item)
	  (if (and (evenp item) (> item best))
	      item
	      best))
	'(7 4 6 5 2))

(defun sum (lst)
  (reduce #'+ lst))

(sum '(1 2 3))
(sum (make-array 3 :initial-contents '(1 2 3)))
(sum "123")

(map 'list
     (lambda (x)
       (if (eq x #\s)
	   #\S
	   x))
     "this is a string")

(map 'string
     (lambda (x)
       (if (eq x #\s)
	   #\S
	   x))
     "this is a string")


(subseq "america" 2 6)

(sort '(5 8 2 4 9 3 6) #'<)

(numberp 5)

(defun add (a b)
  (cond ((and (numberp a) (numberp b) (+ a b)))
	((and (listp a) (listp b) (append a b)))))

(add 1 2)
(add '(1 2) '(3 4))
(add '(1 2) 3)

(defmethod addd ((a number) (b number))
  (+ a b))

(defmethod addd ((a list) (b list))
  (append a b))

(addd 3 4)
(addd '(5 6) '(7 8))
