(import (rnrs))

(define (rot chr offset)
  (let ((lowercase-offset 97)
        (uppercase-offset 65))
    (cond
     [(char-lower-case? chr)
      (integer->char
       (+ lowercase-offset
          (mod (+ offset (- (char->integer chr) lowercase-offset))
               26)))]
     [(char-upper-case? chr)
      (integer->char
       (+ uppercase-offset
          (mod (+ offset (- (char->integer chr) uppercase-offset))
               26)))]
     [else chr])))

(define (rotate phrase dx)
  (string-map (lambda (c) (rot c dx))
              phrase))

