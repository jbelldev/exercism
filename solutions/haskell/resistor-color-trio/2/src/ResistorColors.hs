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
  | val > 10^9 = show (val `div` 10^9) ++ " gigaohms"
  | val > 10^6 = show (val `div` 10^6) ++ " megaohms"
  | val > 10^3 = show (val `div` 10^3) ++ " kiloohms"
  | otherwise  = show  val             ++ " ohms"
  where
    val = ohms resistor

ohms :: Resistor -> Int
ohms (Resistor (a, b, c)) = (10 * fromEnum a + fromEnum b) * (10 ^ fromEnum c)
