(import (rnrs))

(define (convert number)
  (let
    ((result (apply string-append
                     (list
                       (cond ((zero? (modulo number 3)) "Pling")
                             (else ""))
                       (cond ((zero? (modulo number 5)) "Plang")
                             (else ""))
                       (cond ((zero? (modulo number 7)) "Plong")
                             (else ""))))))
  (cond
   ((equal? result "") (number->string number))
   (else result))))
