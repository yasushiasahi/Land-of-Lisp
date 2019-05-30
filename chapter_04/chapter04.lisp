(if '()
    'i-am-true
  'i-am-false)
i-am-false

(if '(1)
    'i-am-true
  'i-am-false)
i-am-true

(defun my-length (list)
  (if list
      (1+ (my-length (cdr list)))
    0))
my-length

(my-length '(一 二 三 四))
4

(eq '() nil)
t
(eq '() ())
t
(eq '() 'nil)
t

(if (= (+ 1 2) 3)
    'yap
  'nope)
yap

(if (= (+ 1 2) 4)
    'yap
  'nope)
nope

(if '(1)
    'the-list-has-stuff-in-it
  'the-list-is-empty)
the-list-has-stuff-in-it

(if ()
    'the-list-has-stuff-in-it
  'the-list-is-empty)
the-list-is-empty

(if (oddp 5)
    'odd-number
  'even-number)
odd-number

(if (listp '(5))
    'odd-number
  (/ 1 0))
odd-number

(defvar *number-was-odd* nil)
*number-was-odd*

(if (= 1 (% 5 2))
    (progn (setf *number-was-odd* t)
	   'odd-number)
  'even-number)
odd-number

*number-was-odd*
t

(defun oddp (num)
  "引数が奇数ならtを返す"
  (= 1 (% num 2)))
oddp


(defvar *number-was-odd* nil)
*number-was-odd*

(when (= 1 (% 5 2))
  (setf *number-was-odd* t)
  'odd-number)
odd-number

*number-was-odd*
t

(unless (oddp 4)
  (setf *number-was-odd* nil)
  'even-number)
even-number

(when (oddp 4)
  (setf *number-was-odd* t)
  'odd-number)
nil

(unless (oddp 5)
  (setf *number-was-odd* nil)
  'even-number)
nil

(defvar *arch-enemy* nil)
*arch-enemy*

(defun pudding-eater (person)
  (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alian)
	 '(cause you lisp alien - you ate my pudding))
	((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
	 '(i hope you choked on my pudding johnny))
	(t '(why you eat my pudding stranger \? ))))
pudding-eater

(pudding-eater 'johnny)
(i hope you choked on my pudding johnny)

*arch-enemy*
useless-old-johnny

(pudding-eater 'henry)
(cause you lisp alien - you ate my pudding)

*arch-enemy*
stupid-lisp-alian

(pudding-eater 'george-clooney)
(why you eat my pudding stranger \?)

(defun pudding-eater-case (person)
  (case person
	((henry) (setf *arch-enemy* 'stupid-lisp-alian)
	 '(cause you lisp alien - you ate my pudding))
	((johnny) (setf *arch-enemy* 'useless-old-johnny)
	 '(i hope you choked on my pudding johnny))
	(t '(why you eat my pudding stranger ))))
pudding-eater-caset



pudding-eater-case

pudding-eater-case

(pudding-eater-case 'johnny)

(case "unko"
      ("unko" "といれ"))

(defun case-test (value)
  (case value
	(1 "one")))
case-test

(case-test 1)

(and (oddp 5) (oddp 7) (oddp 9))
t

(or (oddp 4) (oddp 7) (oddp 8))
t

(defvar *is-it-even* nil)
*is-it-even*

(or (oddp 4) (setf *is-it-even* t))
t

*is-it-even*
t

(setf *is-it-even* nil)
nil

(or (oddp 5) (setf *is-it-even* t))
t

*is-it-even*
nil


(if *file-modified*
    (if (ask-user-about-saving)
	(save-file)))

(and *file-modified* (ask-user-about-saving)*file-modified* (save-file))

(if (and *file-modified*
	 (ask-user-about-saving))
    (save-file))

(member 1 '(2 2 3))
nil

(1 2 3)

(if (member 1 '(3 4 1 5))
    'one-is-in-the-list
  'one-is-not-in-the-list)
one-is-in-the-list

(member 1 '(3 4 1 5))
(1 5)

(if (member nil '(3 4 nil 5))
    'nil-is-in-the-list
  'nil-is-not-in-the-list)
nil-is-in-the-list

(member nil '(3 4 nil 5))
(nil 5)

(find-if #'oddp '(2 4 5 6))

(defparameter *fruit 'apple)

(equal 'apple 'apple)
t

(equal (list 1 2 3) (list 1 2 3))
t

(equal '(1 2 3) (cons 1 (cons 2 (cons 3 nil))))
t

(equal 5 5)
t

(eq 5 5)
t

(equal 2.5 2.5)
t

(equal "foo" "foo")
t

(eql 'foo 'foo)
t

(eql 3.4 3.4)
t

(eql #\a #\a)

(equalp "Bob Smith" "bob smith")
t

(equalp 0 0.0)
t

(= 5 5)
t

(string-equal "hoge" "hoge")
t
