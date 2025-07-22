package reverse

func Reverse(input string) (result string) {
	for _, char := range input {
        result = string(char) + result
    }
    return result
}
