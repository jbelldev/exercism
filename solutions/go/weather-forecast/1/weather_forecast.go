// Package weather provides a function that returns the weather
// forecast of a particular location.
package weather

// CurrentCondition represents the weather condition being reported.
var CurrentCondition string
// CurrentLocation represents the current location of the weather being reported.
var CurrentLocation string

// Forecast returns the weather in both condition and location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
