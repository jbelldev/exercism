package techpalace

import "strings"

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
        intro := "Welcome to the Tech Palace, "
        capitalName := strings.ToUpper(customer)
        return (intro + capitalName)
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
        border := strings.Repeat("*", numStarsPerLine)
        return (border + "\n" + welcomeMsg + "\n" + border)
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
        unlines := strings.Replace(oldMsg, "\n", "", -1)
        trimmed := strings.Trim(unlines, "* ")
        return (trimmed)
}
