;;; accumulate.el --- Accumulate (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun accumulate (lst op)
  "Accumulate results of applying OP to LST."
  (if (eq lst nil)
      nil
    (cons (funcall op (car lst))
          (accumulate (cdr lst) op))))

(provide 'accumulate)
;;; accumulate.el ends here
