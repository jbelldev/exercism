module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List

{-
 - transpose, of course, transposes the chunked input
 - intercalate simply adds a space between each chunk;
 -   splitLines+tranpsose has already padded each chunk with
 -   any necessary spaces.
 -}
encode :: String -> String
encode xs = intercalate " " $ transpose $ splitLines $ map toLower $ input
  where
    input = filter isAlphaNum xs
    -- | width is the number of columns that need to be used to make a rectangle
    -- such that c >= r and c - r <= 1
    width = ceiling . sqrt . fromIntegral . length $ input
    -- | splitLines breaks up the processed input into chunks of the correct size.
    splitLines a =
      unfoldr (\list ->
        if (head list == ' ')
        then Nothing
        else Just (take width list, drop width list)
      ) $ a ++ repeat ' '
