(import (rnrs))

(define (nucleotide-count dna)
  (let loop ((dna (string->list dna))
             (result (list (cons #\A 0)
                           (cons #\C 0)
                           (cons #\G 0)
                           (cons #\T 0))))
    (cond
     [(null? dna) result]
     [(not (member (car dna) '(#\A #\C #\G #\T)))
      (error (format #f "Invalid nucleotide: ~a" (car dna)))]
     [else
      (loop (cdr dna)
            (assoc-set! result (car dna) (1+ (assoc-ref result (car dna)))))])))
