module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (`elem` pangram) ['a'..'z']
  where pangram = map toLower text
