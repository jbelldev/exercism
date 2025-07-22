(import (rnrs))

(define squares
  ;; Pre-computed vector of squares for O(1) access of those under 65
  (let ((vec (make-vector 64)))
    (do ((n 63 (1- n)))
        ((< n 0) vec)
      (vector-set! vec n (expt 2 n)))))

(define (square n)
  "Returns the square at index N. Errors on vector range are passed as-is."
  (vector-ref squares (- n 1)))

(define total
  ;; Sum total of all pre-computed values in `squares`
  (let loop ((k 0)
             (acc 0))
    (if (= k 64)
        acc
        (loop (1+ k) (+ acc (vector-ref squares k))))))
