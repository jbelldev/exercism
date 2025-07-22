;;; protein-translation.el --- Protein Translation (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defvar exercism/codons
    '(("AUG" . "Methionine")
      ("UUU" . "Phenylalanine")
      ("UUC" . "Phenylalanine")
      ("UUA" . "Leucine")
      ("UUG" . "Leucine")
      ("UCU" . "Serine")
      ("UCC" . "Serine")
      ("UCA" . "Serine")
      ("UCG" . "Serine")
      ("UAU" . "Tyrosine")
      ("UAC" . "Tyrosine")
      ("UGU" . "Cysteine")
      ("UGC" . "Cysteine")
      ("UGG" . "Tryptophan")
      ("UAA" . "STOP") ;; STOP codons
      ("UAG" . "STOP")
      ("UGA" . "STOP")))

(defun read-codon (codon)
  "Return the matching protein for CODON, else return an error."
  (let ((result (assoc-string codon exercism/codons)))
    (if (null result)
        (error "Invalid codon")
      (cdr result))))

(defun proteins (strand)
  "Return a list of proteins based on codons in STRAND."
  (let
      ((result (if (string= "" strand)
                   '()
                 (read-codon (substring strand 0 3))))
       (remainder
        (ignore-errors (substring strand 3 nil)))) ; Return remainder or nil
    (cond ((null result) '()) ; Indicates empty input
          ((string= "STOP" result) '()) ; STOP codon ends return early
          (t (cons result (proteins remainder)))))) ; Else cons result to remaining results


(provide 'protein-translation)
;;; protein-translation.el ends here

