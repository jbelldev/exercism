module ArmstrongNumbers (armstrong) where

-- | Integral typeclass seemed a strange choice; the exercise
-- doesn't involve integer division, and Integral will make a
-- few functions require conversions. Changed for readability.
-- armstrong :: (Integral a) => a -> Bool
armstrong :: Int -> Bool
armstrong num =
  let string = show num
      power  = length string
      digits = map (\d -> read [d] :: Int) string
  in  num == (sum $ map (\digit -> digit ^ power) digits)
