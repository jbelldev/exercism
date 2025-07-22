module Isogram (isIsogram) where

import Data.Char (isAlpha, toLower)
import Data.List (group, sort)

isIsogram :: String -> Bool
isIsogram = all ((== 1) . length) . group . sort . map toLower . filter isAlpha
