module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.List (group, sort)
import Data.Map  (Map, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Read, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  if any (not . (`elem` "GCTA")) xs
  then Left "invalid"
  else Right $ fromList . map readDNA . group . sort $ xs
  where
    readDNA x = (read [head x] :: Nucleotide, length x)
