(load "wizards_game.lisp")

(defun have (object)
  (member object (cdr (inventory))))

(defparameter *chain-welded* nil)

(defun weld (subject object)
  (if (and (eq *location* 'attic)
	   (eq subject 'chain)
	   (eq object 'bucket)
	   (have 'chain)
	   (have 'bucket)
	   (not *chain-welded*))
      (progn (setf *chain-welded* t)
	     '(the chain is now securely welded to the bucket.))
      '(you cannot weld like that.)))
(pushnew 'weld *allowed-commands*)

(defparameter *bucket-filled* nil)

(defun dunk (subject object)
  (if (and (eq *location* 'garden)
	   (eq subject 'bucket)
	   (eq object 'well)
	   (have 'bucket)
	   *chain-welded*)
      (progn (setf *bucket-filled* t)
	     '(the bucket is now full of water))
      '(you cannot dunk like that.)))
(pushnew 'dunk *allowed-commands*)

(defmacro game-action (command subj obj place &body body)
  `(progn (defun ,command (subject object)
	    (if (and (eq *location* ,place)
		     (eq subject ,subj)
		     (eq object ,obj)
		     (have ',subj))
		,@body
		'(i cant ,command like that.)))
	  (pushnew ',command *allowed-commands*)))

(game-action weld chain bucket attic
  (if (and (have 'bucket) (not *chain-welded*))
      (progn (setf *chain-welded* 't)
	     '(the chain is now sucurely welded to the bucket.))
      '(you do not have a bucket.)))
