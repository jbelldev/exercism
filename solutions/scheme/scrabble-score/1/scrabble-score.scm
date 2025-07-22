(import (rnrs))

(define (char->value chr)
  "Return the value of the character CHR."
  (let ((chr (char-downcase chr)))
    (cond ((member chr '(#\a #\e #\i #\o #\u #\l #\n #\r #\s #\t)) 1)
          ((member chr '(#\d #\g)) 2)
          ((member chr '(#\b #\c #\m #\p)) 3)
          ((member chr '(#\f #\h #\v #\w #\y)) 4)
          ((member chr '(#\k)) 5)
          ((member chr '(#\j #\x)) 8)
          ((member chr '(#\q #\z)) 10))))

(define (score word)
  "Return the score of the phrase WORD."
  (apply + (map char->value (string->list word))))

