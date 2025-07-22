module Diamond (diamond) where

import Data.Char (toUpper, isAlpha)

surround :: String -> String -> String
surround a b = a ++ b ++ a

-- | Finite list of characters with proper spacing,
-- e.g. 'B B' or 'C   C'
inside :: [String]
inside = ['A'] : zipWith (\x -> surround [x]) ['B' .. 'Z'] [ replicate x ' ' | x <- [1,3..]]

-- | Infinite list of whitespace for outer spacing:
-- ['', '.', '..', '...' .. ]
outside :: [String]
outside = [ replicate x ' ' | x <- [0,1..] ]

-- | Creates diamond by pairing inside strings
-- with proper outside whitespace fittings.
diamond :: Char -> Maybe [String]
diamond n
  | isAlpha (toUpper n) = Just $ zipWith surround outer inner
  | otherwise           = Nothing -- ^ Non-alphanumerics return nothing
  where outer = map (outside !!) $ [limit,limit-1 .. 0] ++ [1..limit]
        inner = map (inside !!)  $ [0..limit] ++ [limit-1,limit-2 .. 0]
        limit = (length $ enumFromTo 'A' n) - 1
