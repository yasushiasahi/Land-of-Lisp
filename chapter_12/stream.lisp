(output-stream-p *standard-output*)

(write-char #\x *standard-output*)

(input-stream-p *standard-input*)

(read-char *standard-input*)


(with-open-file (my-stream "data.txt" :direction :output)
  (print "my data" my-stream))

(with-open-file (my-stream "data.txt" :direction :input)
  (read my-stream))

(let ((animal-noises '((dog . woof)
		       (cat . meow))))
  (with-open-file (my-stream "animal-noises.txt" :direction :output)
    (print animal-noises my-stream)))

(with-open-file (my-stream "animal-noises.txt" :direction :input)
  (read my-stream))

(with-open-file (my-stream "data.txt" :direction :output :if-exists :error)
  (print "my data" my-stream))

(with-open-file (my-stream "data.txt" :direction :output :if-exists :supersede)
  (print "my data supersede" my-stream))



(defparameter foo (make-string-output-stream))
(princ "this will go into foo." foo)
(princ "this will also go into foo. " foo)
(get-output-stream-string foo)

(with-output-to-string (*standard-output*)
  (princ "the sum of ")
  (princ 5)
  (princ " and ")
  (princ 2)
  (princ " is ")
  (princ (+ 5 2)))
