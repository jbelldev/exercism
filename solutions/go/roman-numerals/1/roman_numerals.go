package romannumerals

import (
	"errors"
	"strings"
)

func ToRomanNumeral(input int) (string, error) {
	if input <= 0 || input >= 4000 {
		return "", errors.New("input invalid")
	}

	result := ""

	// M - MMM == 1000 - 3000
	result += strings.Repeat("M", input / 1000)
	input = input % 1000

	switch {
	// CM == 900
	case input >= 900:
		result += "CM"
		input -= 900
	// D  == 500
	case input >= 500:
		result += "D"
		input -= 500
	// CD == 400
	case input >= 400:
		result += "CD"
		input -= 400
	}

	// C - CCC == 100 - 300
	if input >= 100 {
		result += strings.Repeat("C", input / 100)
		input = input % 100
	}

	switch {
	// XC == 90
	case input >= 90:
		result += "XC"
		input -= 90
	// L  == 50
	case input >= 50:
		result += "L"
		input -= 50
	// XL == 40
	case input >= 40:
		result += "XL"
		input -= 40
	}

	// X - XXX == 10 - 30
	if input >= 10 {
		result += strings.Repeat("X", input / 10)
		input = input % 10
	}

	switch {
	// IX == 9
	case input >= 9:
		result += "IX"
		input -= 9
	// V == 5
	case input >= 5:
		result += "V"
		input -= 5
	// IV == 4
	case input == 4:
		result += "IV"
		input -= 4
	}

	// IV == 4
	// I  == 1
	if input == 4 {
		result += "IV"
	} else {
		result += strings.Repeat("I", input)
	}

	return result, nil
}
