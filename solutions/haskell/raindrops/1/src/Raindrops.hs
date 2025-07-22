module Raindrops (convert) where

convert :: Int -> String
convert n = if null str then show n else str
  where
    factor (x,y) = if n `mod` x == 0 then y else []
    sounds = [(3,"Pling"), (5,"Plang"), (7,"Plong")]
    str = concatMap factor sounds
