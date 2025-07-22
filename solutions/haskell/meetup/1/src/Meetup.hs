module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar

type Year = Integer
type Month = Int

data Weekday
  = Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  deriving (Enum, Show, Read)

data Schedule
  = First
  | Second
  | Third
  | Fourth
  | Last
  | Teenth
  deriving Enum

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay schedule weekday year month =
  let day1  = fromGregorian year month 1
      dayC  = read (show $ dayOfWeek day1) :: Weekday
      firstDay = addDays (weekdayDiff dayC weekday) day1
      numWeeks = toInteger $ fromEnum schedule * 7
  in  case schedule of
        Last    -> lastWeekDay firstDay
        Teenth  -> nextTeenthDay firstDay
        _       -> addDays (numWeeks) firstDay

weekdayDiff :: Weekday -> Weekday -> Integer
weekdayDiff day nextDay = toInteger $ mod (fromEnum nextDay - fromEnum day) 7

nextTeenthDay :: Day -> Day
nextTeenthDay day =
  fromGregorian y m $ until (`elem` [13..19]) (+7) d
  where
    (y,m,d) = toGregorian day

lastWeekDay :: Day -> Day
lastWeekDay day =
  fromGregorian y m $ until (\x -> x + 7 > limit) (+7) d
  where
    (y,m,d) = toGregorian day
    limit | m == 2 && isLeapYear y = 29
          | m == 2 = 28
          | otherwise = 31
