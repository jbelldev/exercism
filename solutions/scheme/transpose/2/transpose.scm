(import (rnrs))

(define (head lst)
  "Returns whitespace when LST is empty, else returns car."
  (if (null? lst)
      #\space
      (car lst)))

(define (tail lst)
  "Returns an empty list when LST is empty, else returns cdr."
  (if (null? lst)
      '()
      (cdr lst)))

(define (trim lst)
  "Trim whitespace from right-side of LST."
  (let loop ((lst (reverse lst)))
    (cond
     [(null? lst) (reverse lst)]
     [(equal? #\space (car lst))
      (loop (cdr lst))]
     [else (reverse lst)])))

(define (transpose matrix)
  (let loop ((result '())
             (lst matrix))
    (if (null? (filter (compose not null?) lst))
        (reverse result)
        (loop (cons (trim (map head lst)) result)
              (map tail lst)))))
