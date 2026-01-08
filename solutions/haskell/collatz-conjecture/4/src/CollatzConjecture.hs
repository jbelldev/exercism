module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1 = Nothing
  | otherwise = Just . fromIntegral . length . takeWhile (/= 1) . iterate step $ n
  where step num | even num  = num `div` 2
                 | otherwise = 3 * num + 1
