(import (rnrs))

(define (square n)
  (cond
   ((or (< n 1)
        (> n 64)) (throw 'error))
   ((equal? n 1) 1)
   (else (* 2 (square (- n 1))))))

(define total
  (apply + (map square (iota 64 1))))

