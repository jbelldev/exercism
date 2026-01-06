;;; binary-search.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun find-binary (array value)
  "Return index of VALUE in ARRAY if present, else nil."
  (cl-labels ((loop (left right)
                (let ((middle (/ (+ left right) 2)))
                  (cond
                   ((> left right) nil)
                   ((= value (aref array middle)) middle)
                   ((> value (aref array middle)) (loop (1+ middle) right))
                   (t (loop left (1- middle)))))))
    (loop 0 (1- (length array)))))


(provide 'binary-search)
;;; binary-search.el ends here
