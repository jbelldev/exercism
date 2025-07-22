(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (let ((list-a (string->list strand-a))
        (list-b (string->list strand-b)))
   (cond
    ;; Explicitly disallow inequal length strands
    ((not (eq? (length list-a)
               (length list-b))) (raise (make-error)))
    ;; Recursively compare each pair of characters,
    ;; taking the sum of differences as the hamming distance
    (else
     (length (filter not (map eq? list-a list-b)))))))
