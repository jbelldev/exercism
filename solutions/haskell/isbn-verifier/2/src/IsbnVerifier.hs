module IsbnVerifier (isbn) where

type ISBN = [Int]

validChars :: [Char]
validChars = '-':'X':enumFromTo '0' '9'

toISBN :: String -> ISBN
toISBN =
  map (\x -> if x == 'X' then 10 else read [x] :: Int)
  . filter (`elem` (tail validChars))

calculate :: ISBN -> Int
calculate = sum . zipWith (*) [10,9..1]

isbn :: String -> Bool
isbn input
  -- | Is not an empty string
  | null input = False
  -- | Doesn't contains invalid characters
  | not $ all (`elem` validChars) input = False
  -- | Check sum is not at the end
  | any (== 'X') (init input) = False
  -- | ISBN is the proper length
  | length strISBN /= 10 = False
  -- | ISBN total is divisible by 11
  | otherwise = calculate strISBN `mod` 11 == 0
  where strISBN = toISBN input
