module ReverseString (reverseString) where

reverseString :: String -> String
-- reverseString = reverse          -- most obvious solution
reverseString = foldl (flip (:)) [] -- slightly less easy
