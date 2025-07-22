"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    # Create a Set for each letter in input
    unique_letters = Set{Char}()

    # Since case isn't sensitive, convert input to lowercase
    lowercase_input = lowercase(input)

    # Iterate over all characters in the input
    for character in lowercase_input
        # Add all letters to the set (which will automatically handle duplicates)
        if isletter(character)
            push!(unique_letters, character)
        end
    end

    # Check that our total number of letters equals the 26 that are in the alphabet
    return length(unique_letters) == 26

end

