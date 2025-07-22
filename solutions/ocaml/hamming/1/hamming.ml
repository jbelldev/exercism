type nucleotide = A | C | G | T

let count_mismatch lst =
  List.fold_left (fun acc x -> if x then acc + 1 else acc) 0 lst

let hamming_distance l1 l2 =
  match l1, l2 with
  | [], [] -> Ok 0
  | [], _  -> Error "left strand must not be empty"
  | _, []  -> Error "right strand must not be empty"
  | _ ->
    if List.length l1 <> List.length l2 then
      Error "left and right strands must be of equal length"
    else
      Ok (List.map2 (<>) l1 l2 |> count_mismatch)