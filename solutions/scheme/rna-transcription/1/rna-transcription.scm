(import (rnrs))

(define (translate dna)
  (cond ((eq? dna #\G) #\C)
        ((eq? dna #\C) #\G)
        ((eq? dna #\T) #\A)
        ((eq? dna #\A) #\U)
        (else dna)))

(define (dna->rna dna)
  (string-map translate dna))
