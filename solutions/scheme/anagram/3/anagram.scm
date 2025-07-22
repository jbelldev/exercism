(import (rnrs))

(define (anagram target words)
  "Checks for anagrams of TARGET among the list WORDS."
  (define (normalize word)
    (string-downcase (list->string (sort (string->list word) char-ci<?))))
  (let ((normalized-target (normalize target))
        (target (string-downcase target)))
    (filter (lambda (word)
              (and
               ;; Anagrams are equal when normalized...
               (string=? normalized-target (normalize word))
               ;; ...but inequal when simply downcased.
               (not (string=? target (string-downcase word)))))
            words)))
