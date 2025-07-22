(import (rnrs))

(define alphabet
  (map integer->char (iota 26 97)))  ; Alphabet are the 26 characters after 97

(define (pangram? phrase)
  "Returns true if PHRASE has all letters of the alphabet."
  (let ((normalized-phrase (string->list (string-downcase phrase))))
    (null?  ; List of all characters *not* in phrase, where empty == pangram
     (filter (lambda (chr)
               (not (member chr normalized-phrase)))
             alphabet))))

