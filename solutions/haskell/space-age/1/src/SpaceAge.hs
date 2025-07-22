module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
  deriving (Eq)

ageOn :: Planet -> Float -> Float
ageOn planet seconds
  | planet == Mercury = seconds / earthTime 0.2408467
  | planet == Venus   = seconds / earthTime 0.61519726
  | planet == Earth   = seconds / 31557600
  | planet == Mars    = seconds / earthTime 1.8808158
  | planet == Jupiter = seconds / earthTime 11.862615
  | planet == Saturn  = seconds / earthTime 29.447498
  | planet == Uranus  = seconds / earthTime 84.016846
  | planet == Neptune = seconds / earthTime 164.79132
  | otherwise         = error "PROBLEM!!"
  where
    earthTime = (31557600 *)
