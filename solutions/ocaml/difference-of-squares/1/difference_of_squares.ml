let sum = List.fold_left ( + ) 0
let square = (fun x -> x * x)

let square_of_sum n =
    square (
      sum (List.init (n+1) Fun.id)
    )

let sum_of_squares n =
    List.fold_left ( + ) 0 (List.init (n+1) square)

let difference_of_squares n =
  square_of_sum n - sum_of_squares n