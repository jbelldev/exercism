(import (rnrs))

(define (two-fer . maybe-name)
  (format #f "One for ~a, one for me."
          (if (null? maybe-name)
              "you"
              (car maybe-name))))

