module Style.Types where

import qualified Data.Map as M
import qualified Graphics.UI.SDL as SDL
import Graphics.UI.SDL.TTF.FFI (TTFFont)

data PropKey
    = MarginTop
    | MarginRight
    | MarginBottom
    | MarginLeft
    | Width
    | BorderTopWidth
    | BorderRightWidth
    | BorderLeftWidth
    | BorderBottomWidth
    | BackgroundColor
    | PaddingTop
    | PaddingRight
    | PaddingBottom
    | PaddingLeft
    | Height
    | FontFamily
    | FontColor
    | Display
  deriving (Eq, Ord, Show)

data Units
    = Px
    | Em
    | Percent
    | Pt
    deriving (Eq, Show)

data DisplayType
    = NoneType
    | BlockType
    | InlineType
    deriving (Eq, Show)

data PropVal
    = NumUnit Int Units
    | Color SDL.Color
    | Auto
    | Font TTFFont
    | DisplayVal DisplayType
  deriving (Eq, Show)


-- unsafe accessors
fromPx :: PropVal -> Int
fromPx (NumUnit n Px) = n

fromColor :: PropVal -> SDL.Color
fromColor (Color c) = c

fromFont :: PropVal -> TTFFont
fromFont (Font f) = f

fromDisplayVal :: PropVal -> DisplayType
fromDisplayVal (DisplayVal v) = v

newtype Style = Style (M.Map PropKey PropVal)
  deriving (Show, Eq)

newStyle :: Style
newStyle = Style M.empty
