module Diamond (diamond) where

import Data.Char (toUpper, isAlpha)

surround :: String -> String -> String
surround a b = a ++ b ++ a

-- | staircase [1..5] == [1..5] ++ [4,3..1]
staircase :: [a] -> [a]
staircase xs = xs ++ (reverse $ init xs)

-- | Finite list of characters with proper spacing,
-- e.g. 'B B' or 'C   C'
inside :: [String]
inside = ['A'] : zipWith (\x -> surround [x]) ['B' .. 'Z'] [ replicate x ' ' | x <- [1,3..]]

-- | Infinite list of whitespace for outer spacing:
-- ['', '.', '..', '...', .. ]
outside :: [String]
outside = [ replicate x ' ' | x <- [0,1..] ]

-- | Creates diamond by pairing inside strings
-- with proper outside whitespace fittings.
diamond :: Char -> Maybe [String]
diamond n
  | isAlpha (toUpper n) = Just $ zipWith surround outer inner
  | otherwise           = Nothing -- ^ Non-alphanumerics return nothing
  where limit = (length $ enumFromTo 'A' n) -- ^ Char to Int
        outer = staircase $ reverse $ take limit outside
        inner = staircase $ take limit inside
