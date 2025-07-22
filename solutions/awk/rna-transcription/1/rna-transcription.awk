BEGIN {
    failed = "Invalid nucleotide detected."
    output = ""
}

{
    for (i = 1; i <= length(); i++) {
        char = substr($0, i, 1);
        if      (char == "G") { output = output "C"; }
        else if (char == "C") { output = output "G"; }
        else if (char == "T") { output = output "A"; }
        else if (char == "A") { output = output "U"; }
        else { print failed; exit 1; }
    }
    print output;
}
