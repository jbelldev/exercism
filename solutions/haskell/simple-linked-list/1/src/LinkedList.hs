module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a =
  Empty | LinkedList { datum :: a, next :: LinkedList a }
    deriving (Eq, Show)

fromList :: [a] -> LinkedList a
fromList = foldr new Empty

isNil :: LinkedList a -> Bool
isNil Empty = True
isNil _     = False

new :: a -> LinkedList a -> LinkedList a
new = LinkedList

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList

toList :: LinkedList a -> [a]
toList Empty = []
toList (LinkedList x nl) = x : toList nl
