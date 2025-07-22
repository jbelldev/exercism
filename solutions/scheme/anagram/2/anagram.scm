(import (rnrs))

(define (anagram target words)
  "Checks for anagrams of TARGET among the list WORDS"
  (define (normalize word)
    (list->string (sort (string->list word) char-ci<?)))
  (filter (lambda (word)
            (and (string=? (string-downcase (normalize target))
                           (string-downcase (normalize word)))
                 (not (string=? (string-downcase target)
                                (string-downcase word)))))
          words))

