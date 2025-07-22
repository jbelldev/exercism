module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = take x pascal

pascal :: [[Integer]]
pascal = [1] : [1,1] : derivatives
  where
    derivatives = map (\n -> [1] ++ derive n ++ [1]) (tail pascal)
    derive [_] = []
    derive (x:y:zs) = (x + y) : derive (y:zs)
