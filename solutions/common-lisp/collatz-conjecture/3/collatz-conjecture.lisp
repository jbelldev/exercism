(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (labels ((next (num steps)
             (cond
               ((<= num 0) nil)
               ((= num 1) steps)
               ((oddp num) (next (1+ (* 3 num)) (1+ steps)))
               (t (next (/ num 2) (1+ steps))))))
    (next n 0)))
