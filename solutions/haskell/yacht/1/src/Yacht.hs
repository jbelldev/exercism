module Yacht (yacht, Category(..)) where

import Data.List

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht
  deriving Enum

yacht :: Category -> [Int] -> Int
yacht category dice = yacht' category $ sort dice

yacht' :: Category -> [Int] -> Int
-- | All five dice show the same face
yacht' Yacht (d:ds)
  | all (== d) ds = 50
  | otherwise     = 0

-- | Sum of the dice
yacht' Choice dice = sum dice

-- | Straight of 2 to 6
yacht' BigStraight [2,3,4,5,6] = 30
yacht' BigStraight _           = 0

-- | Straight of 1 to 5
yacht' LittleStraight [1,2,3,4,5] = 30
yacht' LittleStraight _           = 0

-- | Total of four dice with the same face
yacht' FourOfAKind dice
  | null fourOfAKind = 0
  | otherwise        = sum $ take 4 $ head fourOfAKind
  where fourOfAKind = filter (\x -> length x >= 4) $ group dice

-- | Three of one kind, two of another
yacht' FullHouse dice
  | lengthOfDice == [3,2] ||
    lengthOfDice == [2,3] = sum $ map singles groupDice
  | otherwise = 0
  where groupDice = group dice
        lengthOfDice = map length groupDice
        singles xs = yacht' (toEnum (head xs - 1)) xs

-- | Sum of a single type of die
yacht' category dice = sum $ filter (== (1 + fromEnum category)) dice
