;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun acronym (phrase)
  "Return the acronym of PHRASE."
  (let* ((words (split-string phrase "[^[:alpha:]']+" t))
         (initials (mapcar #'string-to-char words))
         (capitals (mapcar #'capitalize initials)))
    (concat capitals)))

(provide 'acronym)
;;; acronym.el ends here
