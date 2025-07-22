module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  let nums = [1 .. (limit - 1)]     -- All numbers under limit
      fs   = filter (/= 0) factors  -- All factors, not including 0
  in  sum [ x | x <- nums, any (\factor -> x `mod` factor == 0) fs ]
