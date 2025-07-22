let sum lst = List.fold_left ( + ) 0 lst
let square x = x * x
let range x f = List.init (x+1) f

let square_of_sum n =
    range n Fun.id |> sum |> square

let sum_of_squares n =
    range n square |> sum

let difference_of_squares n =
  square_of_sum n - sum_of_squares n