(defparameter my-socket (socket-server 4321))
(defparameter my-stream (socket-accept my-socket))

(read my-stream)

(close my-stream)
