(make-array 3)

(defparameter x (make-array 3))

(aref x 1)

(setf (aref x 1) 'foo)

x

(aref x 1)

(setf foo (list 'a 'b 'c))

(second foo)

(setf (second foo) 'z)

foo

(setf foo (make-array 4))

(setf (aref foo 2) (list 'x 'y 'z))

foo

(setf (car (aref foo 2)) (make-hash-table))

foo

(setf (gethash 'zoink (car (aref foo 2))) 5)

foo

(nth 1 '(foo bar baz))
