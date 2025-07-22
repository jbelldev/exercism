module Bob (responseFor) where

import Data.Char (isSpace)

responseFor :: String -> String
responseFor xs
  | null input             = "Fine. Be that way!"
  | allUpper && isQuestion = "Calm down, I know what I'm doing!"
  | isQuestion             = "Sure."
  | allUpper               = "Whoa, chill out!"
  | otherwise              = "Whatever."
  where
    input      = filter (not . isSpace) xs
    isQuestion = last input == '?'
    justAlpha  = filter (`elem` ['A'..'Z'] ++ ['a'..'z']) input
    allUpper   = all (`elem` ['A'..'Z']) justAlpha && length justAlpha > 0
