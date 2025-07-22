(import (rnrs))

(define (divis? year value)
  (zero? (remainder year value)))

(define (leap-year? year)
  (if (divis? year 100)   ;; if year is divisible by 100
      (divis? year 400)   ;;   then return (divis? year 400)
      (divis? year 4)))   ;;   else return (divis? year 4)
