module Prime (nth) where

import Data.List.Ordered (minus)

{- | Naive implementation of Sieve of Eratosthenes: https://en-wp.org/wiki/Sieve_of_Eratosthenes
 - Made slightly less naive using incrementalism and set subtraction (`minus`).
 -}
primes :: [Integer]
primes = sieve [2..]
  where sieve (prime:possible_primes) = prime : sieve (possible_primes `minus` [prime, prime*2 ..])

nth :: Int -> Maybe Integer
nth n
  | n <= 0    = Nothing
  | otherwise = Just $ primes !! (n-1)
