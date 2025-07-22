module SecretHandshake (handshake) where

decToBinary :: Int -> [Int]
decToBinary 0 = [0, 0, 0, 0, 0]
decToBinary 1 = [0, 0, 0, 0, 1]
decToBinary decimal = go decimal 16
  where
    go num 1   = [num]
    go num fac = num `div` fac : go remainder nextFactor
      where
        remainder = num `rem` fac
        nextFactor = fac `div` 2

handshake :: Int -> [String]
handshake input =
  let (start:binary) = decToBinary input
      format = if start >= 1 then id else reverse
      phrases = ["jump", "close your eyes", "double blink", "wink"]
  in format $ map fst $ filter (\(_, b) -> b == 1) $ zip phrases binary
