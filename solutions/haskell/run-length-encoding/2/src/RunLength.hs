module RunLength (decode, encode) where

import Data.List (group, groupBy)
import Text.Read (readMaybe)

decode :: String -> String
decode = go . groupBy (\x y -> notLetter x && notLetter y)
  where
    notLetter = not . (`elem` (' ' : ['A'..'z']))
    go :: [String] -> String
    go [] = []
    go [x] = x
    go (x:y:xs) =
      case readMaybe x :: Maybe Int of
        Just n  -> replicate n (head y) ++ go xs
        Nothing -> x ++ go (y:xs)

encode :: String -> String
encode = concatMap go . group
  where
    go [x] = [x]
    go xs = show (length xs) ++ [head xs]
