# Functions for each factor
def pling: if . % 3 == 0 then "Pling" else "" end;
def plang: if . % 5 == 0 then "Plang" else "" end;
def plong: if . % 7 == 0 then "Plong" else "" end;

# Combined factor function
def raindrops: pling + plang + plong;

.number
    # Construct an object of the number, and factor results
    | { number: .
      , results: (. | raindrops)
      }
    # Check for
    | if .results == "" then "\(.number)" else .results end
