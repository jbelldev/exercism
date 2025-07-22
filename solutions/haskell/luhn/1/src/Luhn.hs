module Luhn (isValid) where

import Data.Char (digitToInt)

isValid :: String -> Bool
isValid str
  | length ints <= 1   = False
  | luhn `rem` 10 == 0 = True
  | otherwise          = False
  where
    ints = normalize str
    luhn = sum $ doubleEveryOther ints

normalize :: String -> [Int]
normalize = map digitToInt . reverse . filter (/= ' ')

doubleEveryOther :: [Int] -> [Int]
doubleEveryOther []  = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:zs) = x : (go (y*2)) : doubleEveryOther zs
  where go n = if n > 9 then n - 9 else n
