(cons 1 (cons 2 (cons 3 nil)))

(cons 1 (cons 2 3))

'(1 . (2 . (3 . nil)))

(cons 2 3)

(setf *print-circle* t)

(defparameter foo (list 1 2 3))

(setf (cdddr foo) foo)

(setf *print-circle* nil)

(defparameter *drink-order* '((bill . double-espresso)
			      (lisa . small-drip-coffee)
			      (john . midium-latte)))

(assoc 'lisa *drink-order*)

(push '(lisa . large-mocha-with-whipped-cream) *drink-order*)

(assoc 'lisa *drink-order*)

(defparameter *house* '((walls
			 (morter (cement)
			  (water)
			  (sand))
			 (bricks))
			(windows (glass)
			 (frame)
			 (curtains))
			(roof (shingles)
			 (chimney))))

(defparameter *wizard-nodes* '((living-room (you are in the living-room. a wizard is snoring loudly on the couch.))
			(garden (you are in a beautiful garden. there is a well in front of you))
			(attic (you are in the attic. there is a giant welding torch in the corner.))))

(defparameter *wizard-edges* '((living-room (garden west door)
				(attic upstairs ladder))
			       (garden (living-room east door))
			       (attic (living-room downstairs ladder))))


(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))
