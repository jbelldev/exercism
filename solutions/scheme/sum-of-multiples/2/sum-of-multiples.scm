(import (rnrs)
        (srfi srfi-1))

(import (rnrs)
        (srfi srfi-1)
        (srfi srfi-42))

(define (sum-of-multiples ints limit)
  "Return the sum of all the multiples of NS under LIMIT."
  (apply +
         (delete-duplicates
          (append-map
           (lambda (int)
             (if (zero? int)
                 '(0)
                 ;; List comprehension of INT's multiple less than LIMIT.
                 (list-ec (: mult int limit int) mult)))
           ints))))
