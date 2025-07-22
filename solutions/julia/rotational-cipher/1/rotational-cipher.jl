"""
    rotate(key::Int, input::Union{Char, String})

Encrypt `input` using Caesarian cipher with `key` rotations
"""

function rotate(key, input::Char)
    # Only apply rotations to alphabet characters
    if isletter(input)
        # `base` is the ASCII value of 'a' or 'A', depending on the case of the input
        base = islowercase(input) ? 97 : 65
        # Rotate the character within the bounds of the alphabetic characters,
        # so 'z' and 'Z' wraps to 'a' and 'A' respectively
        return Char((Int(input) - base + key) % 26 + base)
    # Non-alphabetic characters are not rotated
    else
        return input
    end
end

function rotate(key, input::String)
    # Apply the character rotation function to the input string
    return map(char -> rotate(key, char), input)
end
