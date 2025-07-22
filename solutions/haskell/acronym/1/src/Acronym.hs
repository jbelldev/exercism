{-# LANGUAGE OverloadedStrings #-}
module Acronym (abbreviate) where

import           Data.Char (isLower, isUpper)
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
    -- and all uppercase letters otherwise.
    matchCase :: Text -> Text
    matchCase x =
      if T.all isUpper x || T.all isLower x
      then T.singleton $ T.head x
      else T.filter isUpper x
