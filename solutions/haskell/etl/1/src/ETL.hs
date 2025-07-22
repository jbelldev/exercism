module ETL (transform) where

import           Data.Char       (toLower)
import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

transform :: Map a String -> Map Char a
transform =
    Map.fromList       -- ^ return as Map
  . map switch         -- ^ Interchange all values and keys
  . concatMap sequence -- ^ (Int,String) pairs become [(Int,Char)]
  . Map.toAscList      -- ^ Create as list
    where switch (x,y) = (toLower y, x)
