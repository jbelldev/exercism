module School (School, add, empty, grade, sorted) where

import Data.List          (sort)
import Data.Maybe         (fromMaybe)
import Data.IntMap.Strict (IntMap)
import qualified Data.IntMap.Strict as M

-- | Starting out trying to implement with Data.Set,
-- ended using (and learning) IntMap. Rather simple.
-- I suppose this is the power of libraries.

-- | Schools are just IntMaps
type School = IntMap [String]

-- | Inserts new students, then sorts the grade
add :: Int -> String -> School -> School
add gradeNum student school =
  M.insertWith ((sort .) . (++)) gradeNum [student] school

-- | Empty schools == empty maps
empty :: School
empty = M.empty

-- | If the school has a matching grade, use it.
-- Otherwise, give an empty list
grade :: Int -> School -> [String]
grade gradeNum school = fromMaybe [] $ school M.!? gradeNum

-- | Just return the school, already sorted on insertion
sorted :: School -> [(Int, [String])]
sorted = M.toList
