module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n =
  if n < 1
  then Nothing
  else Just $ (toInteger . length $ collatz' n) - 1
  where
    collatz' n
      | n == 1  = [1]
      | even n  = n : collatz' evenN
      | odd  n  = n : collatz' oddN
      where
        evenN = n `div` 2  
        oddN  = 3 * n + 1 
