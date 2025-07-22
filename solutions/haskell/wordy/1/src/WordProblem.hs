module WordProblem (answer) where

import Data.List (isPrefixOf,isSuffixOf)
import Data.Maybe (fromJust, fromMaybe)
import Text.Read (readMaybe)

{- An attempt before realizing a parser had a lot of edge cases
-- I didn't want to have to account for manually, so decided to move
-- to a library. I missed where this was suggested in the original 
-- exercise, but this was still a useful practice.
-}

-- No comments because it was still WIP when I moved on to a library
--

operations :: [(String, Integer -> Integer -> Integer)]
operations =
  [ ("plus",       (+)        )
  , ("minus",      (subtract) )
  , ("multiplied", (*)        )
  , ("divided",    (flip div) )
  ]

format :: String -> Maybe [String]
format input =
  if "What is " `isPrefixOf` input && "?" `isSuffixOf` input
  then Just $ filter (/= "by") . words . trim $ input
  else Nothing
  where
    trim = reverse . drop 1 . reverse . drop 8

parse :: String -> String -> Maybe Integer -> Maybe Integer
parse op value x = lookup op operations <*> (readMaybe value :: Maybe Integer) <*> x

process :: Maybe [String] -> Maybe Integer
process Nothing = Nothing
process (Just (initialValue:rest)) = 
  let operations = go rest
      go []       = []
      go (x:y:zs) = parse x y : go zs
  in foldl (\x y -> y . x) id operations (readMaybe initialValue :: Maybe Integer)

answer :: String -> Maybe Integer
answer = process . format
