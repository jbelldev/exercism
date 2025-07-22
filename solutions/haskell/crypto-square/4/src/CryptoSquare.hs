module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List

encode :: String -> String
encode xs = unwords $ transpose $ chunksOf width $ input
  where
    input = map toLower $ filter isAlphaNum xs
    width = ceiling . sqrt . fromIntegral . length $ input
    -- ^ width is the number of columns that need to be used to make a rectangle
    -- such that c >= r and c - r <= 1

-- chunksOf makes chunks of `x`-length, padded with spaces.
chunksOf :: Int -> String -> [String]
chunksOf x str =
  unfoldr (\list ->
    if (head list == ' ')
    then Nothing
    else Just (take x list, drop x list)
  ) $ str ++ repeat ' '
