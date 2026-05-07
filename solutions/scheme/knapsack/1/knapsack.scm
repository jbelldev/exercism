(import (rnrs)
        (srfi srfi-1))

(define (value? lst)
  "Returns value of the knapsack LST."
  (apply + (map cdr lst)))

(define (max-by-value . lst)
  "Returns the knapsack with the greatest value in LST."
  (car (sort lst (lambda (x y)
                   (>= (value? x) (value? y))))))

(define (knapsack capacity weights values)
  (define h (make-hash-table))
  (define (h? capacity items)
    (hash-ref h (cons capacity items)))
  (define (h! capacity items result)
    (hash-set! h (cons capacity items) result)
    result)

  (define items
    (map cons weights values))

  (define (take-max weight items)
    "Accepts list of ITEMS and returns max items under WEIGHT."
    (or (h? weight (length items))
        (cond
         [(null? items) '()]
         [(>= weight (caar items))
          (h!
           weight
           (length items)
           (max-by-value
            (cons (car items) (take-max (- weight (caar items)) (cdr items)))
            (take-max weight (cdr items))))]
         [else (h! weight
                   (length items)
                   (take-max weight (cdr items)))])))

  (value? (take-max capacity items)))
