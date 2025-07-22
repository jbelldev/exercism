module Grains (square, total) where

square :: Integer -> Maybe Integer
square n =
  if n > 0 && n <= 64
  then Just $ 2^(n-1)
  else Nothing

total :: Integer
total = sum $ map (\x -> 2^(x-1)) [1..64]
