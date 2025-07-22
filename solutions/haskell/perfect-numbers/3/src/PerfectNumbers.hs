module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquot :: Int -> Int
aliquot n = sum divisors
  where divisors = [ x | x <- [1..(n `div` 2)], n `mod` x == 0, x /= n ]

classify :: Int -> Maybe Classification
classify n
  | n <= 0         = Nothing
  | aliquot n  > n = Just Abundant
  | aliquot n == n = Just Perfect
  | aliquot n  < n = Just Deficient
