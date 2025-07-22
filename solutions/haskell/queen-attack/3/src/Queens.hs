module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = concat [ charAtPos (rank, file) | rank <- [0..7], file <- [0..7] ]
  where charAtPos position@(x, y)
          | Just position == white && y == 7 = "W\n"
          | Just position == black && y == 7 = "B\n"
          | Just position == white = "W "
          | Just position == black = "B "
          | y == 7                 = "_\n"
          | otherwise              = "_ "

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack queenA@(xA,yA) queenB@(xB,yB)
  | xA == xB || yA == yB = True
  | otherwise = queenB `elem` diagonals queenA
  where
    diagonals = takeWhile isValid . iterate (\(x,y) -> (fx x, fy y))
    isValid (i,j) = 0 <= i && i <= 7 && 0 <= j && j <= 7
    fx = if xA < xB then (+ 1) else (subtract 1)
    fy = if yA < yB then (+ 1) else (subtract 1)
