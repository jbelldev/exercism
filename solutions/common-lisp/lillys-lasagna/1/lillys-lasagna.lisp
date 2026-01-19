(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven ()
  "Return the expected oven time in minutes: 337."
  337)

(defun remaining-minutes-in-oven (minutes-in-oven)
  "Return remaining minutes in oven given MINUTES-IN-OVEN."
  (- (expected-time-in-oven) minutes-in-oven))

(defun preparation-time-in-minutes (layers)
  "Return preparation time required for number of LAYERS."
  (* 19 layers))

(defun elapsed-time-in-minutes (layers minutes-in-oven)
  "Return the total elapsed time based on number of LAYERS and MINUTES-IN-OVEN."
  (+ (preparation-time-in-minutes layers)
     minutes-in-oven))
