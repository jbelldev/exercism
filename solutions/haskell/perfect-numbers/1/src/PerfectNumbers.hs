module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n < 1          = Nothing
  | n < aliquot n  = Just Abundant
  | n == aliquot n = Just Perfect
  | n > aliquot n  = Just Deficient

aliquot :: Int -> Int
aliquot n = sum divisors
  where divisors = [ x | x <- [1..(n `div` 2)], n `mod` x == 0, x /= n ]
