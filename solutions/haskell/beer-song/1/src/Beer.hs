module Beer (song) where

import Text.Printf (printf)

song :: String
song = sing 99
  where
    lyrics    = "%d bottles of beer on the wall, %d bottles of beer.\n\
                \Take one down and pass it around, %d bottles of beer on the wall.\n\n"
    lyrics'   = "2 bottles of beer on the wall, 2 bottles of beer.\n\
                \Take one down and pass it around, 1 bottle of beer on the wall.\n\n"
    lyrics''  = "1 bottle of beer on the wall, 1 bottle of beer.\n\
                \Take it down and pass it around, no more bottles of beer on the wall.\n\n"
    lyrics''' = "No more bottles of beer on the wall, no more bottles of beer.\n\
                \Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    sing :: Int -> String
    sing x
      | x > 2     = printf lyrics x x (x-1) ++ sing (x-1)
      | x > 1     = printf lyrics'          ++ sing (x-1)
      | x > 0     = printf lyrics''         ++ sing (x-1)
      | otherwise = printf lyrics'''
