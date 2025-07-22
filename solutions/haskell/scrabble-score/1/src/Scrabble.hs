module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

worth1  = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']
worth2  = ['D', 'G']
worth3  = ['B', 'C', 'M', 'P']
worth4  = ['F', 'H', 'V', 'W', 'Y']
worth5  = ['K']
worth8  = ['J', 'X']
worth10 = ['Q', 'Z']

scoreLetter :: Char -> Integer
scoreLetter x
  | letter `elem` worth1  = 1
  | letter `elem` worth2  = 2
  | letter `elem` worth3  = 3
  | letter `elem` worth4  = 4
  | letter `elem` worth5  = 5
  | letter `elem` worth8  = 8
  | letter `elem` worth10 = 10
  | otherwise = 0
  where letter = toUpper x

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter
