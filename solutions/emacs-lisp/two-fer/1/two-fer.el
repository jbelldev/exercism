;;; two-fer.el --- Two-fer Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun two-fer (&optional name)
  "Addresses NAME, otherwise addresses 'you'."
  (let ((name (or name "you")))
    (concat "One for " name ", one for me.")))


(provide 'two-fer)
;;; two-fer.el ends here
