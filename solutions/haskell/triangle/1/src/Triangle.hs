module Triangle (TriangleType(..), triangleType) where

import Data.List (group, sort)

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  | Degenerate
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | any (<= 0) [a,b,c]  = Illegal
  | passDegenerateCheck = Degenerate
  | failLengthsCheck    = Illegal
  | length sides == 3   = Scalene
  | length sides == 2   = Isosceles
  | length sides == 1   = Equilateral
  | otherwise           = Illegal
  where
    failLengthsCheck = not $
      a + b > c &&
      a + c > b &&
      b + c > a
    passDegenerateCheck =
      a + b == c ||
      a + c == b ||
      b + c == a
    sides = group . sort $ [a,b,c]
