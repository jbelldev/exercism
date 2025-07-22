package protein

import "errors"

var ErrStop = errors.New("ErrStop")
var ErrInvalidBase = errors.New("ErrInvalidBase")

func FromRNA(rna string) ([]string, error) {
	var results []string

	for i := 0; i <= len(rna)-3; i+=3 {
		polypeptide, err := FromCodon(rna[i:i+3])

		if err == ErrInvalidBase {
			return results, ErrInvalidBase
		} else if err == ErrStop {
			return results, nil
		}

		results = append(results, polypeptide)
	}
	return results, nil
}

func FromCodon(codon string) (string, error) {
	switch codon {
		case
			"AUG": return "Methionine", nil
		case
			"UUU",
			"UUC": return "Phenylalanine", nil
		case
			"UUA",
			"UUG": return "Leucine", nil
		case
			"UCU",
			"UCC",
			"UCA",
			"UCG": return "Serine", nil
		case
			"UAU",
			"UAC": return "Tyrosine", nil
		case
			"UGU",
			"UGC": return "Cysteine", nil
		case
			"UGG": return "Tryptophan", nil
		case
			"UAA",
			"UAG",
			"UGA": return "", ErrStop
		default:
			return "", ErrInvalidBase
	}
}
