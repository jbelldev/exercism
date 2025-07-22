module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA line =
  if any notDNA line
  then Left  (head $ filter notDNA line)
  else Right (toRNA' line)
  where
    notDNA = not . (`elem` "GCTA")

toRNA' :: String -> String
toRNA' [] = []
toRNA' (x:xs)
  | x == 'G'  = "C" ++ toRNA' xs
  | x == 'C'  = "G" ++ toRNA' xs
  | x == 'T'  = "A" ++ toRNA' xs
  | x == 'A'  = "U" ++ toRNA' xs
