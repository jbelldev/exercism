(import (rnrs)
        (srfi srfi-1))

(define (sum-of-multiples ints limit)
  "Return the sum of all the multiples of INTS under LIMIT."

  (define (mults-under int limit)
    (define (done? seed) (<= limit seed))
    (define (keep seed) seed)
    (define (next seed) (+ seed int))
    (if (zero? int)
        '()
        (unfold done? keep next int)))

  (apply +
         (delete-duplicates
          (append-map (lambda (n) (mults-under n limit))
                      ints))))
