;;; allergies.el --- Allergies Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun allergen-list (score)
  "Return list of allergens according to allergy SCORE."
  (cl-labels ((loop (n acc)
                (cond ((>= n 256) (loop (- n 256) acc))
                      ((>= n 128) (loop (- n 128) (cons "cats" acc)))
                      ((>= n 64)  (loop (- n 64)  (cons "pollen" acc)))
                      ((>= n 32)  (loop (- n 32)  (cons "chocolate" acc)))
                      ((>= n 16)  (loop (- n 16)  (cons "tomatoes" acc)))
                      ((>= n 8)   (loop (- n 8)   (cons "strawberries" acc)))
                      ((>= n 4)   (loop (- n 4)   (cons "shellfish" acc)))
                      ((>= n 2)   (loop (- n 2)   (cons "peanuts" acc)))
                      ((= n 1)    (cons "eggs" acc))
                      (t acc))))
    (loop score nil)))

(defun allergic-to-p (score allergen)
  "Accepts SCORE and return true if allergic to ALLERGEN."
  (if (member allergen (allergen-list score))
      t))


(provide 'allergies)
;;; allergies.el ends here
