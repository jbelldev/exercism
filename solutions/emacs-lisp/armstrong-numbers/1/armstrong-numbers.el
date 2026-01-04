;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun armstrong-p (n)
  "Return non-nil if N is an Armstrong number, else nil."
  (let* ((digits (mapcar 'char-to-string (string-to-list (number-to-string n))))
         (length (length digits)))
    (= n
       (apply '+
              (mapcar (lambda (x) (expt (string-to-number x) length))
                      digits)))))


(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
