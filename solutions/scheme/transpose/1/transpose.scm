(import (rnrs))

(define (head lst)
  (if (null? lst)
      #\space
      (car lst)))

(define (trim lst)
  "Trim whitespace from right-side of LST."
  (let loop ((lst (reverse lst)))
    (cond
     [(null? lst) (reverse lst)]
     [(char=? #\space (car lst))
      (loop (cdr lst))]
     [else (reverse lst)])))

(define (transpose matrix)
  (let ((non-empty (lambda (lst) (filter (compose not null?) lst)))
        (cdr-or-empty (lambda (lst) (if (null? lst) '() (cdr lst)))))
    (let loop ((result '())
               (lst matrix))
      (if (null? (non-empty lst))
          (reverse result)
          (loop (cons (map head lst) result)
                (map cdr-or-empty lst))))))

