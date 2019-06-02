(defstruct person
  name
  age
  waist-size
  favorite-color)

(defparameter *bob* (make-person :name "Bob"
				 :age 35
				 :waist-size 32
				 :favorite-color "blue"))

*bob*

(person-age *bob*)

(setf (person-age *bob*) 36)

(defparameter *that-guy* #S(person :name "Ken" :age 35 :waist-size 32 :favorite-color "blue"))
(person-age *that-guy*)
