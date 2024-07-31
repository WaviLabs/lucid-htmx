{- |
Module      : Lucid.Htmx.Swap
Description : Provides a type for swap styles

Provides a type and utilities for the "swap style" for hx-swap
<https://htmx.org/attributes/hx-swap/>
-}
module Lucid.Htmx.Swap where

import Data.Text (Text, pack)
import Lucid.Htmx.Render

-- | <https://htmx.org/attributes/hx-swap/>
-- The different styles that can be used for swapping in content.
-- Usually defaults to 'InnerHTML'
data Swap
  = -- | Replace the inner html of the target element
    InnerHTML 
  | -- | Replace the entire target element with the response
    OuterHTML 
  | -- | Replace the text content of the target element, without parsing the response as HTML
    TextContent 
  | -- | Insert the response before the target element
    BeforeBegin 
  | -- | Insert the response before the first child of the target element
    AfterBegin 
  | -- | Insert the response after the last child of the target element
    BeforeEnd 
  | -- | Insert the response after the target element
    AfterEnd 
  | -- | Deletes the target element regardless of the response
    Delete 
  | -- | Does not append content from response (out of band items will still be processed).
    None

instance Render Swap where
  render = \case
    InnerHTML -> "innerHTML"
    OuterHTML -> "outerHTML"
    TextContent -> "textContent"
    BeforeBegin -> "beforeBegin"
    AfterBegin -> "afterBegin"
    BeforeEnd -> "beforeEnd"
    AfterEnd -> "afterEnd"
    Delete -> "delete"
    None -> "none"
