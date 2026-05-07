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
    (hash-set! h (cons capacity items) result))
  
  ;; Combine weights and values into their item form.
  (define knapsack-items
    (map cons weights values))

  (define (take-max weight items n)
    (or (hashed? weight n)
        (cond
         [(null? items) '()]
         [(>= weight (caar items))
          (hash! weight n
                 (max-by-value
                  (cons (car items) (take-max (- weight (caar items)) (cdr items) (1- n)))
                  (take-max weight (cdr items) (1- n))))]
         [else (hash! weight n
                      (take-max weight (cdr items) (1- n)))])))

  ;; Calculate the value of the largest knapsack config.
  (value? (take-max capacity knapsack-items (length knapsack-items))))
