(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (let ((list-a (string->list strand-a))
        (list-b (string->list strand-b)))
   (cond
    ;; Disallow inequal length strands
    ((not (eqv? (length list-a)
                (length list-b))) (raise (make-error)))
    ;; Disallow left-empty strand
    ((and (null? list-a)
          (not (null? list-b))) (raise (make-error)))
    ;; Disallow right-empty list
    ((and (null? list-b)
          (not (null? list-a))) (raise (make-error)))
    ;; Base Case
    ((null? list-a) 0)
    ;; Recursives
    ((equal? (car list-a)
             (car list-b)) (+ 0 (hamming-distance (list->string (cdr list-a))
                                                  (list->string (cdr list-b)))))
    (else (+ 1 (hamming-distance (list->string (cdr list-a))
                                 (list->string (cdr list-b))))))))
