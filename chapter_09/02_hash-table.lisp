(make-hash-table)

(defparameter x (make-hash-table))

(gethash 'yup x)

(setf (gethash 'yup x) '25)

(gethash 'yup x)

(setf (gethash 'hop x) 34)

(defparameter *drink-order* (make-hash-table))

(setf (gethash 'bill *drink-order*) 'double-espressso)
(setf (gethash 'lisa *drink-order*) 'small-dirp-coffee)
(setf (gethash 'john *drink-order*) 'medium-latte)

*drink-order*

(gethash 'lisa *drink-order*)


(round 2.4)

(defun foo ()
  (values 3 7))

(foo)

(+ (foo) 5)

(multiple-value-bind (a b) (foo)
  (* a b))


(load "./../chapter_08/grand-theft-wumpus-retry")

(setf *edge-num* 1000)
(setf *node-num* 1000)

(time (dotimes (i 100) (get-connected 1 (make-edge-list))))
