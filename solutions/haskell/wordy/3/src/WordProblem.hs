module WordProblem (answer) where

import Data.List (foldl')

import Text.Parsec
import Text.Parsec.String

{- | Parsec uses `do` notation, which makes building sequential parsers incredibly simple.
 - In most cases, the parsers here are just char by char reads of the value we're looking for.
 -}

integerParser :: Parser Integer
integerParser = do
  sign <- option ' ' (char '-')
  digits <- many1 digit
  let number = read digits
  return $ if sign == '-' then negate number else number

{- | Operation parser drops the operation name and collects the integer value, then constructs a function for applying.
 - The general sequence is 1) remove the operator, 2) skip any spaces, and 3) build the function
 -}
operationParser :: Parser (Integer -> Integer)
operationParser = choice $ map try [ plus, minus, multiply, divide, power ]
  where
    plus = do
      _ <- string "plus"
      spaces
      y <- integerParser
      return (+ y)
    minus = do
      _ <- string "minus"
      spaces
      y <- integerParser
      return (flip (-) y)
    multiply = do
      _ <- string "multiplied by"
      spaces
      y <- integerParser
      return (* y)
    divide = do
      _ <- string "divided by"
      spaces
      y <- integerParser
      return (`div` y)
    power = do
      _ <- string "raised to the"
      spaces
      y <- integerParser
      -- | Since "raised to the Nth power" has a suffix, this needs to be parsed as well
      optional (string "st" <|> string "nd" <|> string "rd" <|> string "th")
      spaces
      _ <- string "power"
      return (^ y)

-- | The expression parser simply puts it all together
expressionParser :: Parser Integer
expressionParser = do
  _ <- string "What is"
  spaces
  x <- integerParser
  spaces
  -- | The beauty of this line is that `many` works from 0 to infinite operations, so it also evaluates with no operations
  operations <- many (operationParser <* spaces)
  _ <- string "?"
  eof
  -- | Since we don't need to operate on infinite lists here, we use `foldl'` instead of `foldl` for more-strict evaluation
  return $ foldl' (\acc f -> f acc) x operations

answer :: String -> Maybe Integer
answer input = case parse expressionParser "(fakesource)" input of
  Left _       -> Nothing
  Right result -> Just result
