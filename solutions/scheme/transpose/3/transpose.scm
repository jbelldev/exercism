(import (rnrs))

(define (transpose matrix)
  "Use the power Scheme to transpose MATRIX."
  (if (null? matrix)
      '()
      (apply map list matrix)))  ; Insane this works so well
