module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor
  | val > 1000000000 = show (val `div` 1000000000) ++ " gigaohms"
  | val > 1000000    = show (val `div` 1000000)    ++ " megaohms"
  | val > 1000       = show (val `div` 1000)       ++ " kiloohms"
  | otherwise        = show  val                   ++ " ohms"
  where
    val = ohms resistor

ohms :: Resistor -> Int
ohms (Resistor (a, b, c)) = (10 * fromEnum a + fromEnum b) * (10 ^ fromEnum c)
