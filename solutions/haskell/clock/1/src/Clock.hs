module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

data Clock = Clock { getTime  :: Int }
  deriving (Eq,Ord,Show)

fullDay :: Int
fullDay = 24 * 60

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = addDelta hour minute (Clock 0)

getHours :: Clock -> Int
getHours (Clock time) = time `div` 60

getMinutes :: Clock -> Int
getMinutes (Clock time) = time `rem` 60

toString :: Clock -> String
toString clock = printf "%02d:%02d" hours minutes
  where
    hours = getHours clock
    minutes = getMinutes clock

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Clock currTime)
  | newTime >= fullDay = Clock $ until (< fullDay) (subtract fullDay) newTime
  | newTime >= 0       = Clock $ newTime
  | newTime <  0       = Clock $ until (>= 0) (+ fullDay) newTime
  where
    delta = (hour * 60) + minute
    newTime = currTime + delta
