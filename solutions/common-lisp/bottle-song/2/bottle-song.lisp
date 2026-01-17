(defpackage :bottle-song
  (:use :common-lisp)
  (:export :recite))

(in-package :bottle-song)

(defun num-to-str (num)
  (cdr (assoc num '((0 . "no")
                    (1 . "one")
                    (2 . "two")
                    (3 . "three")
                    (4 . "four")
                    (5 . "five")
                    (6 . "six")
                    (7 . "seven")
                    (8 . "eight")
                    (9 . "nine")
                    (10 . "ten")))))

(defun verse (num)
  (let ((bottles (if (= num 1)
                     "bottle"
                     "bottles"))
        (next-bottles (if (= (1- num) 1)
                          "bottle"
                          "bottles"))
        (capital-str (string-capitalize (num-to-str num)))
        (next-string (num-to-str (1- num))))
    (list (format nil "~a green ~a hanging on the wall," capital-str bottles)
          (format nil "~a green ~a hanging on the wall," capital-str bottles)
          "And if one green bottle should accidentally fall,"
          (format nil "There'll be ~a green ~a hanging on the wall." next-string next-bottles))))

(defun recite (start-bottles take-down)
  "Returns the song verses from START-BOTTLES down to (- START-BOTTLES TAKE-DOWN)."
  (labels ((sing (num countdown)
             (cond ((<= countdown 0) nil)
                   ((= countdown 1) (verse num))
                   (t (append
                       (verse num)
                       '("")
                       (sing (1- num) (1- countdown)))))))
    (sing start-bottles take-down)))
