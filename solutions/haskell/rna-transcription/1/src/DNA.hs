module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA []  = Right ""
toRNA line =
  if any (not . (`elem` "GCTA")) line
  then Left  (head $ filter (not . (`elem` "GCTA")) line)
  else Right (toRNA' line)

toRNA' :: String -> String
toRNA' [] = []
toRNA' (x:xs)
  | x == 'G'  = "C" ++ toRNA' xs
  | x == 'C'  = "G" ++ toRNA' xs
  | x == 'T'  = "A" ++ toRNA' xs
  | x == 'A'  = "U" ++ toRNA' xs
