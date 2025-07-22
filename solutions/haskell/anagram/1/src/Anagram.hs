module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)
  where
    prepare = sort . map toLower
    isAnagram x y =
      prepare x == prepare y
      && map toLower x /= map toLower y
