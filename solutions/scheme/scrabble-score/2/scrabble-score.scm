(import (rnrs))

(define (char->value chr)
  "Return the value of the character CHR."
  (let ((chr (char-downcase chr)))
    (case chr
      ((#\a #\e #\i #\o #\u #\l #\n #\r #\s #\t) 1)
      ((#\d #\g) 2)
      ((#\b #\c #\m #\p) 3)
      ((#\f #\h #\v #\w #\y) 4)
      ((#\k) 5)
      ((#\j #\x) 8)
      ((#\q #\z) 10))))

(define (score word)
  "Return the score of the phrase WORD."
  (apply + (map char->value (string->list word))))

