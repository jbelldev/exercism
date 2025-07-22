(import (rnrs))

;; Direct and classic implementation of binary search
(define (binary-search array target)
  "Search ARRAY for index of TARGET. Returns 'not-found when missing."
  (let loop ((l 0)
             (r (1- (vector-length array))))
    (let ((index (+ l (floor (/ (- r l) 2)))))
      (cond
       ((< r l) 'not-found)
       ((= target (vector-ref array index)) index)
       ((< (vector-ref array index) target) (loop (1+ index) r))
       ((> (vector-ref array index) target) (loop l (1- index)))))))
