module GameOfLife (tick) where

type Position = (Int, Int)
type Matrix = [[Int]]

getPos :: Position -> Matrix -> Int
getPos (x,y) matrix = matrix !! y !! x

neighbors :: Position -> Matrix -> [Int]
neighbors (x,y) matrix =
  [ matrix !! y' !! x' | x' <- [x-1,x,x+1], y' <- [y-1,y,y+1]
                       , isValid x' y'
                       , x' /= x || y' /= y
                       ]
  where maxHeight = length matrix
        maxWidth  = length $ head matrix
        isValid a b = 0 <= a && a < maxWidth && 0 <= b && b < maxHeight

processLiveOrDie :: Position -> Matrix -> Int
processLiveOrDie pos@(x,y) matrix
  | (livingNeighbors == 2 || livingNeighbors == 3) && isAlive cell = 1
  | livingNeighbors == 3 && not (isAlive cell) = 1
  | otherwise = 0
  where
    cell = getPos pos matrix
    livingNeighbors = length $ filter isAlive $ neighbors (x,y) matrix
    isAlive = (> 0)

toPositions :: Matrix -> [Position]
toPositions matrix =
  let maxHeight = length matrix
      maxWidth  = length $ head matrix
   in [ (x, y) |  y <- [0..maxHeight-1], x <- [0..maxWidth-1] ]

formMatrix :: [Int] -> Matrix -> Matrix
formMatrix [] _ = []
formMatrix states matrix = [take width states] ++ formMatrix (drop width states) matrix
  where width  = length $ head matrix

tick :: Matrix -> Matrix
tick [] = []
tick matrix = matrix'
  where
    positions = toPositions matrix
    transformations = map (\pos -> processLiveOrDie pos matrix) positions
    matrix' = formMatrix transformations matrix
