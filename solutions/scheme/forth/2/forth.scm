(use-modules ((rnrs) #:select (div)))

(define (parse lst)
  "Parses LST into a list of symbols or numbers."
  (let ((input (string-split (string-join lst) #\space))
        (string-or-symbol (lambda (x) (if (number? (string->number x))
                                          (string->number x)
                                          (string->symbol (string-downcase x))))))
    (map string-or-symbol input)))

(define (forth program)
  "Interpets PROGRAM with Forth stack rules."

  ;; Syntax table for Forth process
  (define syntax-table
    `((+ . ,(lambda (stack)
              (if (> 2 (length stack))
                  (error "Too few items on stack" stack)
                  (cons (+ (cadr stack) (car stack))
                        (cddr stack)))))
      (- . ,(lambda (stack)
              (if (> 2 (length stack))
                  (error "Too few items on stack" stack)
                  (cons (- (cadr stack) (car stack))
                        (cddr stack)))))
      (* . ,(lambda (stack)
              (if (> 2 (length stack))
                  (error "Too few items on stack" stack)
                  (cons (* (cadr stack) (car stack))
                        (cddr stack)))))
      (/ . ,(lambda (stack)
              (cond
               [(> 2 (length stack))
                (error "Too few items on stack" stack)]
               [(= 0 (car stack))
                (error "Cannot divide by zero" stack)]
               [else
                (cons (div (cadr stack) (car stack))
                      (cddr stack))])))
      (dup . ,(lambda (stack)
                (if (> 1 (length stack))
                    (error "Cannot `dup` on empty stack" stack)
                    (cons (car stack)
                          stack))))
      (drop . ,(lambda (stack)
                 (if (> 1 (length stack))
                     (error "Cannot `drop` from empty stack" stack)
                     (cdr stack))))
      (swap . ,(lambda (stack)
                 (if (> 2 (length stack))
                     (error "Cannot `swap`, too few items on list" stack)
                     (cons (cadr stack)
                           (cons (car stack)
                                 (cddr stack))))))
      (over . ,(lambda (stack)
                 (if (> 2 (length stack))
                     (error "Cannot `over`, too few items on list" stack)
                     (cons (cadr stack)
                           stack))))))

  (define (forth-op? sym)
    "Checks if SYM is a Forth operation on the syntax table."
    (not (equal? (assoc sym syntax-table) #f)))

  (define (new-syntax! lst)
    "Defines new syntax LST.
On finding symbol ;, completes definition and returns remainder of LST."
    (let ((name (if (number? (car lst))
                    (error "Cannot redefine number" (car lst))
                    (car lst))))
      (let loop ((definition (list))
                 (lst (cdr lst)))
        (cond
         [(number? (car lst))
          (loop (cons (lambda (stack) (cons (car lst) stack)) definition)
                (cdr lst))]
         [(forth-op? (car lst))
          (loop (cons (assoc-ref syntax-table (car lst)) definition)
                (cdr lst))]
         [(equal? (car lst) '#{\;}#)
          (set! syntax-table
                (assoc-set! syntax-table
                            name
                            (lambda (stack)
                              ((apply compose definition) stack))))
          (cdr lst)]
         [else (error "Not a valid symbol" (car lst))]))))

  (let loop ((stack '())
             (input (parse program)))
    (cond
     ;; EOL => return the stack
     [(null? input) stack]
     ;; Numbers => add to stack 
     [(number? (car input))
      (loop (cons (car input) stack)
            (cdr input))]
     ;; New definition => modify syntax table and loop
     [(equal? (car input) ':)
      (loop stack
            (new-syntax! (cdr input)))]
     ;; Forth operations => perform against stack
     [(forth-op? (car input))
      (loop ((assoc-ref syntax-table (car input)) stack)
            (cdr input))]
     ;; All other terms are undefined
     [else (error "Undefined term" (car input))])))

