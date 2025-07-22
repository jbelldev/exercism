{-# LANGUAGE OverloadedStrings #-}
module Acronym (abbreviate) where

import           Data.Char (isLower, isUpper, isAlpha)
import qualified Data.Text as T
import           Data.Text (Text)

abbreviate :: Text -> Text
abbreviate  =
    T.toUpper           -- ^ Capitalize
  . T.concat            -- ^ Concat into text string
  . map matchCase       -- ^ Take acronym letters
  . T.words             -- ^ Deliminate on whitespace
  . T.replace "-" " "   -- ^ Deliminate on dashes
  where
    -- | matchCase takes the first letter when all letters match case,
    -- and all uppercase letters + first letter otherwise
    matchCase :: Text -> Text
    matchCase x =
      let str = T.filter isAlpha x
      in  if T.all isUpper str || T.all isLower str
          then T.singleton $ T.head str
          else T.head str `T.cons` T.filter isUpper (T.tail str)
