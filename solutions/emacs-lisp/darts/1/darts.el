;;; darts.el --- Darts (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun score (x y)
  "Return the score of the dart at position (X, Y)."
  (let ((point (sqrt
                (+ (expt x 2)
                   (expt y 2)))))
    (cond ((<= point 1) 10)
          ((<= point 5)  5)
          ((<= point 10) 1)
          (t 0))))


(provide 'darts)
;;; darts.el ends here
