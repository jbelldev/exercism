(defpackage :line-up
  (:use :cl)
  (:shadow format)
  (:export :format))

(in-package :line-up)

(defun format (name number)
  (let ((last-one (mod number 10))
        (last-two (mod number 100)))
    (cl:format
     nil
     "~a, you are the ~d~a customer we serve today. Thank you!"
     name
     number
     (if (<= 11 last-two 13)
         "th"
         (case last-one
           (1 "st")
           (2 "nd")
           (3 "rd")
           (t "th"))))))
