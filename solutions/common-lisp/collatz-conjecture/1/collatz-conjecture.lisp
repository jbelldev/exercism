(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (if (<= n 0)
      NIL
      (loop for num = n
              then (if (oddp num)
                       (1+ (* 3 num))
                       (/ num 2))
            until (= num 1)
            counting 1)))
