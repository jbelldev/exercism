(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (cond
    ((<= n 0) nil)
    ((= n 1) 0)
    ((oddp n) (1+ (collatz (1+ (* 3 n)))))
    (t (1+ (collatz (/ n 2))))))
