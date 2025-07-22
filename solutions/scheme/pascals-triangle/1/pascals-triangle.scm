(import (rnrs))

(define (factorial n)
  "Returns the factorial of N."
  (apply * (iota n 1)))

(define (pascal n k)
  "Identifies the value of `N choose K` in Pascal's Rule."
  (/ (factorial n)
     (* (factorial k)
        (factorial (- n k)))))

(define (pascals-triangle n)
  "Constructs Pascal's triangle to the Nth row."
  (let loop ((i 0)
             (lst '()))
    (if (>= i n)
        lst
        (let ((positions (iota (1+ i)))  ; Returns all positions on row `i`
              (pos->pascal (lambda (k)   ; Returns value at position `k` in row `i`
                             (pascal i k))))
          (loop (1+ i) (append lst (list (map pos->pascal positions))))))))
