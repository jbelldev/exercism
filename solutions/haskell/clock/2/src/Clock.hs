module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

data Clock = Clock { getTime  :: Int }
  deriving Eq

fullDay :: Int
fullDay = 24 * 60

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = addDelta hour minute (Clock 0)

toString :: Clock -> String
toString (Clock time) = printf "%02d:%02d" hours minutes
  where
    hours = time `div` 60 `mod` 24
    minutes = time `rem` 60

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute (Clock time) = Clock time'
  where
    delta = (hour * 60) + minute
    time'
      | time + delta >= fullDay = until (< fullDay) (subtract fullDay) (time + delta)
      | time + delta >= 0       = time + delta
      | time + delta <  0       = until (>= 0) (+ fullDay) (time + delta)
