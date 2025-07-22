module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North | East | South | West
  deriving (Eq, Show, Enum)

type Position = (Integer, Integer)

data Robot = Robot
  { bearing     :: Bearing
  , coordinates :: Position
  }

mkRobot :: Bearing -> Position -> Robot
mkRobot = Robot

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft dir   = pred dir

turnRight :: Bearing -> Bearing
turnRight West = North
turnRight dir  = succ dir

advance :: Robot -> Robot
advance (Robot dir (x,y))
  | dir == North = Robot dir (x,   y+1)
  | dir == East  = Robot dir (x+1, y)
  | dir == South = Robot dir (x,   y-1)
  | dir == West  = Robot dir (x-1, y)

move :: Robot -> String -> Robot
move robot [] = robot
move robot@(Robot dir pos) (x:xs)
  | x == 'l' || x == 'L' = move (Robot (turnLeft  dir) pos) xs
  | x == 'r' || x == 'R' = move (Robot (turnRight dir) pos) xs
  | x == 'a' || x == 'A' = move (advance robot) xs
  | otherwise = robot
