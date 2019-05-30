(defparameter *location* 'living-room)

(defparameter *nodes* '((living-room (you are in the living-room. a wizard is snoring loudly on the couch.))
			(garden (you are in a beautiful garden. there is a well in front of you))
			(attic (you are in the attic. there is a giant welding torch in the corner.))))

(defparameter *edges* '((living-room (garden west door) (attic upstairs ladder))
			(garden (living-room east door))
			(attic (living-room downstairs ladder))))

(defparameter *objects* '(whisky bucket frog chain))

(defparameter *object-locations* '((whisky living-room)
				   (bucket living-room)
				   (frog garden)
				   (chain garden)))


(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
	     (eq (cadr (assoc obj obj-locs)) loc)))
    (remove-if-not #'at-loc-p objs)))

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
	     `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(defun look ()
  (append (describe-location *location* *nodes*)
	  (describe-paths *location* *edges*)
	  (describe-objects *location* *objects* *object-locations*)))


(defun walk (direction)
  (let ((next (find direction
		    (cdr (assoc *location* *edges*))
		    :key #'cadr)))
    (if next
	(progn (setf *location* (car next))
	       (look))
	'(you ccannot go that way.))))

(defun pickup (object)
  (cond ((member object
		 (objects-at *location* *objects* *object-locations*))
	 (push (list object 'body) *object-locations*)
	 `(you are now carryng the ,object))
	(t '(you cannot get that.))))

(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))



;; (describe-location 'living-room *nodes*)
;; (describe-path '(garden west door))
;; (describe-paths 'living-room *edges*)
;; (assoc 'living-room *edges*)
;; (mapcar #'describe-path (cdr '(living-room (garden west door) (attic upstairs ladder))))
;; (apply #'append '((there is a door going west from here.) (there is a ladder going upstairs from here.)))
;; (mapcar #'1+ '(1 2 3 4 5))
;; (mapcar #'car '((foo bar) (baz qux)))
;; (let ((car "Honda Civic"))
;;   (mapcar #'car '((foo bar) (baz qux))))
;; (append '(mary had) '(a) '(little lamb))
;; (apply #'append '((mary had) (a) (little lamb)))
;; (objects-at 'living-room *objects* *object-locations*)
;; (describe-objects 'living-room *objects* *object-locations*)
;; (find '3 '((5 x) (3 y) (7 z)) :key #'car)
;; (walk 'west)
;; (defparameter *foo* '(1 2 3))
;; (push 7 *foo*)
;; (setf *foo* (cons 9 *foo*))
;; (setq *foo* (cons 11 *foo*))
;; (member 'foo '(hoge fuga buz foo))
;; (walk 'east)
;; (pickup 'whisky)
;; *object-locations*
;; (inventory)
