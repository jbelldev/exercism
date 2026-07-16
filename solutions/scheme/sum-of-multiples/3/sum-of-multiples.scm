(import (rnrs)
        (srfi srfi-1))

;; Final implementation using a hashtable against seen multiples
(define (sum-of-multiples ints limit)
  "Return the sum of all the multiples of INTS under LIMIT."
  (let ((seen (make-eqv-hashtable)))
    (for-each
     (lambda (int)
       (unless (zero? int)
         (let loop ((multiple int))
           (when (< multiple limit)
             (hashtable-set! seen multiple #t)
             (loop (+ multiple int))))))
     ints)
    (fold + 0 (vector->list (hashtable-keys seen)))))
