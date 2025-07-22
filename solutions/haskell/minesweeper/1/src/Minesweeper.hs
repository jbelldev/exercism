{-# LANGUAGE RecordWildCards #-}

module Minesweeper (annotate) where

import Data.Maybe (mapMaybe)

-- | Defines a type for maintaining (x, y) coordinates
type Position = (Int, Int)

-- | Represents a single square, being either empty or mined
data Square = Empty | Mine
  deriving (Show, Eq)

-- | Represents a minefield, with a list of squares and defined row and column limit
data Minefield = Minefield
  { rows    :: Int
  , columns :: Int
  , field   :: [[Square]]
  } deriving Show

-- | Converts a given character to the Square equivalent
parseToSquare :: Char -> Square
parseToSquare char = case char of
  '*' -> Mine
  ' ' -> Empty
  err -> error $ "Not a valid Square: " ++ show err

{- | Construct a Minefield from a given list of strings.
 - NOTE: assumes that all strings are the same length.
 -}
createMinefield :: [String] -> Minefield
createMinefield input = Minefield{..}
  where
    rows = length input
    columns = length $ head input
    field = map (map parseToSquare) input

{- | Identifies the Square at the given Position of a Minefield.
 - Returns Nothing if the Position is not valid, and Just Square otherwise.
 -}
checkPos :: Minefield -> Position -> Maybe Square
checkPos Minefield{..} (x, y)
  | 0 <= x && x < columns &&
    0 <= y && y < rows = Just $ field !! y !! x
  | otherwise = Nothing

-- | Creates a list of all possible surrounding Positions of a given Position.
surroundingPos :: Position -> [Position]
surroundingPos (x, y) = [ (x + dx, y + dy) | dx <- [-1..1], dy <- [-1..1], dx /= 0 || dy /= 0]

{- | Takes a minefield and returns it as a list of strings.
 - Mine Squares become '*'.
 - Empty Squares become the number of mines surrounding the Square's Position (as a Char).
 -}
graphMines :: Minefield -> [String]
graphMines minefield@Minefield{..} = [ [ displaySquare (x, y) | x <- [0..columns-1] ] | y <- [0..rows-1] ]
  where displaySquare :: Position -> Char
        displaySquare position
          | checkPos minefield position == Just Mine = '*'
          | numberOfMines == 0 = ' '
          | otherwise = head . show $ numberOfMines
          where numberOfMines = length
                              . filter (== Mine)
                              . mapMaybe (checkPos minefield)
                              $ surroundingPos position

-- | Main test function.
-- Accepts a list of strings representing Minefield.
-- Returns list of processed Mines.
--}
annotate :: [String] -> [String]
annotate = graphMines . createMinefield
