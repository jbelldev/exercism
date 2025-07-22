(import (rnrs))

;; Direct and classic implementation of binary search
(define (binary-search array target)
  "Search ARRAY for index of TARGET. Returns 'not-found when missing."
  (let loop ((l 0)
             (r (1- (vector-length array))))
    (let ((index (quotient (+ l r) 2)))
      (cond
       ((> l r) 'not-found)
       ((= target (vector-ref array index)) index)
       ((> target (vector-ref array index)) (loop (1+ index) r))
       ((< target (vector-ref array index)) (loop l (1- index)))))))
