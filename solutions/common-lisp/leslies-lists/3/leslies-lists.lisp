(defpackage :leslies-lists
  (:use :cl)
  (:export :new-list
           :list-of-things
           :add-to-list
           :first-thing
           :second-thing
           :third-thing
           :twenty-third-thing
           :remove-first-item
           :on-the-list-p
           :list-append
           :just-how-long
           :part-of-list
           :list-reverse))

(in-package :leslies-lists)

;; Turns all of the functions into a direct alias for their real counterpart
;; Uses partial application and list splitting to work
(defmacro alias (name func &rest func-args)
  `(defun ,name (&rest args)
     (apply #',func ,@func-args args)))

(alias new-list       list)
(alias list-of-things list)
(alias add-to-list    cons)
(alias first-thing    first)
(alias second-thing   second)
(alias third-thing    third)
(alias twenty-third-thing nth 22)
(alias remove-first-item cdr)
(alias list-append    append)
(alias just-how-long  length)
