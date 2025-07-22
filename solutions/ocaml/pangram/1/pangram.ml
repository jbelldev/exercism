open String

let is_pangram str =
  let alphabet = "abcdefghijklmnopqrstuvwxyz"
  in for_all (contains (lowercase_ascii str)) alphabet