module Isogram (isIsogram) where

import Data.Char (isAlpha, toLower)
import Data.List (sort)

isIsogram :: String -> Bool
isIsogram = go . sort . map toLower . filter isAlpha
  where go []  = True
        go [_] = True
        go (x:y:zs)
          | x == y    = False
          | otherwise = True && go (y:zs)
