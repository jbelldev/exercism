module Darts (score) where

score :: Float -> Float -> Int
score x y
  | point <= 1  = 10
  | point <= 5  = 5
  | point <= 10 = 1
  | otherwise   = 0
  where point = sqrt $ x^2 + y^2
