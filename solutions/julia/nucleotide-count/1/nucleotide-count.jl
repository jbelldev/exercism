"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    valid_chars = ['A', 'C', 'T', 'G']
    counts = Dict('A' => 0, 'C' => 0, 'T' => 0, 'G' => 0)

    for char in strand
        if char in valid_chars
            counts[char] += 1
        else
            throw(DomainError(char,("Invalid character '$char' found.")))
        end
    end

    return counts
end
