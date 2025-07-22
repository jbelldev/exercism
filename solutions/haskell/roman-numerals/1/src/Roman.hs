module Roman (numerals) where

data Numeral
  = I | V
  | X | L
  | C | D
  | M
  deriving (Enum, Eq, Show, Read)

-- | Read integer using a numeral representing its
-- decimal base.
readIntAsNum :: Int -> Numeral -> String
readIntAsNum int x
  | int `elem` [1,2,3] = take int $ cycle currNum
  | int == 4           = currNum ++ nextNum
  | int == 5           = nextNum
  | int `elem` [6,7,8] = nextNum ++ take (int `rem` 5) (cycle currNum)
  | int == 9           = currNum ++ nextPwr
  | otherwise          = ""
  where currNum = show x
        nextNum = show $ succ x
        nextPwr = show $ succ $ succ x

numerals :: Integer -> Maybe String
numerals n = Just $ concat $ reverse $ zipWith readIntAsNum numbers romans
  where
    -- | List of Ints representing n, sorted by base
    numbers = reverse $ map (\x -> (read [x] :: Int)) $ show n
    -- | List of base numerals
    romans = map toEnum [0,2..]
