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
  "Use dynamic programming to identify the most valuable knapsack."

  ;; Hash table helper, indexed by weight and number of remaining items
  (define h (make-hash-table))
  (define (hashed? capacity items)
    (hash-ref h (cons capacity items)))
  (define (hash! capacity items result)
    (hash-set! h (cons capacity items) result)
    result)

  ;; Combine weights and values into their item form.
  (define knapsack-items
    (map cons weights values))

  (define (take-max weight items)
    "Accepts list of ITEMS and returns max items under WEIGHT."
    (or (hashed? weight (length items))
        (cond
         [(null? items) '()]
         [(>= weight (caar items))
          (hash!
           weight
           (length items)
           (max-by-value
            (cons (car items) (take-max (- weight (caar items)) (cdr items)))
            (take-max weight (cdr items))))]
         [else (hash! weight
                      (length items)
                      (take-max weight (cdr items)))])))

  ;; Calculate the value of the largest knapsack config.
  (value? (take-max capacity knapsack-items)))
