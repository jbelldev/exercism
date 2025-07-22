module Phone (number) where

number :: String -> Maybe String
number xs = checkLength xs
        >>= checkNatCode
        >>= checkAreaCode
        >>= checkExchange

-- | Proper length is 10 or 11
checkLength :: String -> Maybe String
checkLength xs
  | length n < 10 || length n > 11 = Nothing
  | otherwise = Just n
  where n = filter (`elem` (enumFromTo '0' '9')) xs

-- | National code must be 1
checkNatCode :: String -> Maybe String
checkNatCode n
  | length n == 10 = Just n
  | head n /= '1'  = Nothing
  | otherwise      = Just $ tail n

-- | Area code must be greater than 1
checkAreaCode :: String -> Maybe String
checkAreaCode n
  | head n <= '1' = Nothing
  | otherwise     = Just n

-- | Exchange code must be greater than 1
checkExchange :: String -> Maybe String
checkExchange n
  | n !! 3 <= '1' = Nothing
  | otherwise     = Just n
