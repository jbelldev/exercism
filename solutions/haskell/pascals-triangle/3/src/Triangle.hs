module Triangle (rows) where

rows :: Int -> [[Integer]]
rows x = take x pascal

pascal :: [[Integer]]
pascal = [1] : [1,1] : map derive (tail pascal)
  where
    derive row = [1] ++ zipWith (+) row (tail row) ++ [1]
