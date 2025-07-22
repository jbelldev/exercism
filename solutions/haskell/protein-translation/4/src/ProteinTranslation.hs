module ProteinTranslation(proteins) where

-- Attempt at a more Type-Driven solution in Haskell

data Codon = AUG                   -- Methionine
           | UUU | UUC             -- Phenylalanine
           | UUA | UUG             -- Leucine
           | UCU | UCC | UCA | UCG -- Serine
           | UAU | UAC             -- Tyrosine
           | UGU | UGC             -- Cysteine
           | UGG                   -- Tryptophan
           | UAA | UAG | UGA       -- Stop
  deriving (Eq, Show, Read)

data Protein = Methionine | Phenylalanine | Leucine | Serine | Tyrosine
             | Cysteine | Tryptophan | Stop
  deriving (Eq, Show, Read)

codonToProtein :: Codon -> Maybe Protein
codonToProtein AUG = Just Methionine
codonToProtein UUU = Just Phenylalanine
codonToProtein UUC = Just Phenylalanine
codonToProtein UUA = Just Leucine
codonToProtein UUG = Just Leucine
codonToProtein UCU = Just Serine
codonToProtein UCC = Just Serine
codonToProtein UCA = Just Serine
codonToProtein UCG = Just Serine
codonToProtein UAU = Just Tyrosine
codonToProtein UAC = Just Tyrosine
codonToProtein UGU = Just Cysteine
codonToProtein UGC = Just Cysteine
codonToProtein UGG = Just Tryptophan
codonToProtein UAA = Just Stop
codonToProtein UAG = Just Stop
codonToProtein UGA = Just Stop

readCodon :: String -> Maybe Codon
readCodon s = case reads s of
  [(codon, "")] -> Just codon
  _ -> Nothing

translate :: String -> [Maybe Protein]
translate [] = []
translate input = case readCodon codon of
  Just c ->
    case codonToProtein c of
      Just Stop -> []
      p -> p : translate rest
  Nothing -> translate rest
  where
    (codon, rest) = splitAt 3 input

proteins :: String -> Maybe [String]
proteins = fmap (map show) . sequence . translate
