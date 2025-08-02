(import (rnrs))

(define (clean-marks phone-number)
  "Drops valid punctuation from PHONE-NUMBER"
  (string-filter (lambda (chr)
                   (case chr
                     [(#\( #\) #\space #\- #\.) #f]
                     [else #t]))
                 phone-number))

(define (clean phone-number)
  (let loop ((input (string->list (clean-marks phone-number))))
    (cond
     ;; Drop (valid) country indicator and code
     [(eq? #\+ (car input))
      (loop (cdr input))]
     [(eq? #\1 (car input))
      (loop (cdr input))]
     ;; Error on invalid length
     [(not (eq? 10 (length input)))
      (error 'err "invalid input")]
     ;; Error on invalid area code
     [(eq? #\0 (car input))
      (error 'err "invalid input")]
     ;; Error on invalid exchange code
     [(or (eq? #\0 (cadddr input))
          (eq? #\1 (cadddr input)))
      (error 'err "invalid input")]
     [else (list->string input)])))

