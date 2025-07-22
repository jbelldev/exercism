(import (rnrs))

(define (factorial n)
  "Returns the factorial of N."
  (apply * (iota n 1)))

(define (pascal n k)
  "Identifies the value of `N choose K` in Pascal's Rule."
  (/ (factorial n)
     (* (factorial k)
        (factorial (- n k)))))

(define (make-row n)
  "Creates the Nth row of Pascal's triangle."
  (let ((columns (iota (1+ n)))
        (col->value (lambda (k) (pascal n k))))
    (map col->value columns)))

(define (pascals-triangle n)
  "Constructs Pascal's triangle to the Nth row."
  (map make-row (iota n)))
