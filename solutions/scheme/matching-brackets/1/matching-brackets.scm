(import (rnrs))

;; Simple implementation using naive stack, could be better with continuations.

(define open-close-alist
  '((#\( . #\))
    (#\{ . #\})
    (#\[ . #\])))

(define (open? chr)
  "Returns whether CHR is an opening mark."
  (case chr
    [( #\( #\{ #\[ ) #t]
    [else #f]))

(define (close? chr)
  "Returns whether CHR is a closing mark."
  (case chr
    [( #\) #\} #\] ) #t]
    [else #f]))

(define (matching? pair)
  "Returns if PAIR are matching set of marks."
  (equal? (assoc-ref open-close-alist (car pair))
          (cdr pair)))

(define (balanced? string)
  "Returns whether STRING is balanced in opening and closing marks."
  (let loop ((stack '())
             (input (string->list string)))
    (cond
     ;; When input is complete, return true if there are no missing pairs
     [(null? input) (null? stack)]
     ;; When finding an opening mark, add it to the stack.
     [(open? (car input))
      (loop (cons (car input) stack) (cdr input))]
     ;; On finding a closing mark, attempt to pop it's pair from the stack
     [(close? (car input))
      (if (or (null? stack)
              (not (matching? (cons (car stack)
                                    (car input)))))
          #f
          (loop (cdr stack) (cdr input)))]
     ;; On any other character, keep walking the input
     [else (loop stack (cdr input))])))
