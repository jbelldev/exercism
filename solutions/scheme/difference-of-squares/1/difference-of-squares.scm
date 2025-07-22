(import (rnrs))

(define (square-of-sum n)
  "Returns (1+2+...+N)^2 as N*((1+n)/2)"
  (let ((sum (* n
                (/ (1+ n)
                   2))))
    (expt sum 2)))

(define (sum-of-squares n)
  "Returns 1^2+2^2+...+N^2 as (N*(N+1)*(2N+1))/6"
  (/ (* n
        (1+ n)
        (1+ (* 2 n)))
     6))

(define (difference-of-squares n)
  (- (square-of-sum n)
     (sum-of-squares n)))



