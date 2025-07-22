module Prime (nth) where

-- | Naive implementation of Sieve of Eratosthenes, with even numbers removed
primes :: [Integer]
primes = 2 : sieve [3,5..]
  where sieve (prime:possible_primes) = prime : sieve [ prime' | prime' <- possible_primes, prime' `mod` prime > 0 ]

nth :: Int -> Maybe Integer
nth n
  | n <= 0    = Nothing
  | otherwise = Just $ primes !! (n-1)
