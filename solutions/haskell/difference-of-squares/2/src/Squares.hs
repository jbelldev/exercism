module Squares (difference, squareOfSum, sumOfSquares) where

-- | Idiomatic solution commented out,
-- algorithmic solution in place.

difference :: Integral a => a -> a
difference n = squareOfSum n - sumOfSquares n

squareOfSum :: Integral a => a -> a
-- squareOfSum n = (^ 2) $ sum [1..n]
squareOfSum n = ( ( n * (n+1) ) `div` 2 ) ^ 2

sumOfSquares :: Integral a => a -> a
-- sumOfSquares n = sum $ map (^ 2) [1..n]
sumOfSquares n = ( n * (n+1) * (2*n+1) ) `div` 6
