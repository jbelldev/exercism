module ProteinTranslation(proteins) where

import qualified Data.Map as Map

definitions :: Map.Map String String
definitions = Map.fromList $
  [ ("AUG", "Methionine")
  , ("UUU", "Phenylalanine")
  , ("UUC", "Phenylalanine")
  , ("UUA", "Leucine")
  , ("UUG", "Leucine")
  , ("UCU", "Serine")
  , ("UCC", "Serine")
  , ("UCA", "Serine")
  , ("UCG", "Serine")
  , ("UAU", "Tyrosine")
  , ("UAC", "Tyrosine")
  , ("UGU", "Cysteine")
  , ("UGC", "Cysteine")
  , ("UGG", "Tryptophan")
  , ("UAA", "STOP")
  , ("UAG", "STOP")
  , ("UGA", "STOP")
  ]

translate :: String -> [Maybe String]
translate [] = []
translate input
  | name == Just "STOP" = []
  | otherwise           = name : translate rest
  where
    (codon, rest) = splitAt 3 input
    name = Map.lookup codon definitions

proteins :: String -> Maybe [String]
proteins = sequence . translate
