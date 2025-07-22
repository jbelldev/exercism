module Prime (nth) where

{- | Naive implementation of Sieve of Eratosthenes, with even numbers pre-removed.
 - Works by removing the multiples of each prime number as we encounter them from the list of possible primes.
 - (source: https://en-wp.com/wiki/Sieve_of_Eratosthenes)
 -}
primes :: [Integer]
primes = 2 : sieve [3,5..]
  where sieve (prime:possible_primes) = prime : sieve [ prime' | prime' <- possible_primes, prime' `mod` prime > 0 ]

nth :: Int -> Maybe Integer
nth n
  | n <= 0    = Nothing
  | otherwise = Just $ primes !! (n-1)
