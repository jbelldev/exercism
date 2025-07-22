(import (rnrs)
        (srfi srfi-1))

(define (out-of-bounds? lst)
  (let ((x (car lst))
        (y (cadr lst)))
    (or (> y 7) (< y 0)
        (> x 7) (< x 0))))

(define (diagonals lst)
  (define (go proc1 proc2)
    (lambda (lst) (list (proc1 (car lst))
                        (proc2 (cadr lst)))))
  (append (unfold out-of-bounds? identity (go 1+ 1+) lst)
          (unfold out-of-bounds? identity (go 1- 1+) lst)
          (unfold out-of-bounds? identity (go 1+ 1-) lst)
          (unfold out-of-bounds? identity (go 1- 1-) lst)))

(define (attacking? white black)
  (cond
   [(= (car  white) (car  black)) #t]
   [(= (cadr white) (cadr black)) #t]
   [(any (lambda (x) (equal? x black))
         (diagonals white))       #t]
   [else #f]))

