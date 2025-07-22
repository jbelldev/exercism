# Default to "you"
BEGIN { name = "you" }

# If any input exists, replace name with input
{ name = ($1 ? $0 : "you") }

# Output name
END { print "One for " name ", one for me." }
