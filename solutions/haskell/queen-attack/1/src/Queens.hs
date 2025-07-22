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
  | otherwise = isDiagonal queenA queenB

isDiagonal :: (Int, Int) -> (Int, Int) -> Bool
isDiagonal (xA,yA) (xB,yB)
  | isInvalid xA || isInvalid yA = False
  | xA == xB && yA == yB = True
  | xA == xB || yA == yB = False
  | otherwise = isDiagonal (x', y') (xB,yB)
  where
    isInvalid n = n < 0 || n > 7
    x' = if xA < xB then xA + 1 else xA - 1
    y' = if yA < yB then yA + 1 else yA - 1
