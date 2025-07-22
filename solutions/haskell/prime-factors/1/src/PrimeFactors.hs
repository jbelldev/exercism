module PrimeFactors (primeFactors) where

import Data.List (unfoldr)

-- https://wiki.haskell.org/Prime_numbers
primes :: [Integer]
primes = 2 : 3 : 5 : 7 :
  [i | i <- [9,11..],  
        and [rem i p > 0 | p <- takeWhile (\p -> p^2 <= i) primes]]

primeFactors :: Integer -> [Integer]
primeFactors = unfoldr (\input ->
  let factor = getPrime input primes
  in  if factor == 0
      then Nothing
      else Just (factor, input `div` factor)
  )
  where
    getPrime n (p:ps)
      | n `mod` p == 0  = p
      | p > n           = 0
      | otherwise       = getPrime n ps
