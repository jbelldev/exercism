module ETL (transform) where

import           Data.Char       (toLower)
import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

transform :: Map a String -> Map Char a
transform =
    Map.fromList       -- ^ return to Map
  . map switch         -- ^ Interchange all values and keys
  . concatMap sequence -- ^ (Int,String) pairs become [(Int,Char)]
  . Map.toAscList      -- ^ Change Map to List
    where switch (x,y) = (toLower y, x)
