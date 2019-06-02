(loop for i
	below 5
      sum i)

(loop for i
      from 5
	to 10
      sum i)

(loop for i
	in '(100 20 3)
      sum i)

(loop for i
	below 5
      do (print i))

(loop for i
	below 10
      when (oddp i)
	do (print i))

(loop for i
      from 0
      do (print i)
      when (= i 5)
	return 'falafel)

(loop for i
	in '(2 3 4 5 6)
      collect (* i i))

(loop for x below 10
      for y below 10
      collect (+ x y))

(loop for x below 10
      for y below 10
      do (progn
	   (fresh-line)
	   (princ "x=") (princ x)
	   (princ " ")
	   (princ "y=") (princ y)))

(loop for x below 10
      collect (loop for y below 10
		    collect (+ x y)))

(loop for i from 0
      for day in '(mon tue wed thu fri sat sun)
      collect (cons i day))
