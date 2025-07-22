module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import Data.List (elemIndex)
import Data.Maybe (fromJust)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

charToPlant :: Char -> Plant
charToPlant 'C' = Clover
charToPlant 'G' = Grass
charToPlant 'R' = Radishes
charToPlant 'V' = Violets

data Garden = Garden
  { getStudents :: [String]
  , getPlants   :: [[Plant]]
  } deriving (Eq, Show)

garden :: [String] -> String -> Garden
garden students plants = Garden students $
  map (map charToPlant) (lines plants)

lookupPlants :: String -> Garden -> [Plant]
lookupPlants student (Garden students plants) =
  let index = (fromJust $ elemIndex student students) + 1
      (i1,i2) = ((index-1) * 2, index * 2 - 1)
  in  concat [ [row !! i1, row !! i2] | row <- plants ]
