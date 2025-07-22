module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = take x pascal

pascal :: [[Integer]]
pascal = [1] : [1,1] : map derive (tail pascal)
  where
    derive x = let row = [0] ++ x ++ [0]
                in zipWith (+) row (tail row)
