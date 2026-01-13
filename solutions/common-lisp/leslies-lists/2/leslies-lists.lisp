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

;; Turns most (but not all) of the functions into a direct alias for their real counterpart
(defmacro alias (name func)
  `(defun ,name (&rest args)
     (apply #',func args)))

(alias new-list       list)
(alias list-of-things list)
(alias add-to-list    cons)
(alias first-thing    first)
(alias second-thing   second)
(alias third-thing    third)
(alias remove-first-item cdr)
(alias list-append       append)
(alias just-how-long     length)

;; The one exception, requiring splitting the provided list
(defun twenty-third-thing (&rest list)
  (apply #'nth 22 list))

