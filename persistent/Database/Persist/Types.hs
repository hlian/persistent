{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE OverloadedStrings #-}
module Database.Persist.Types
    ( module Database.Persist.Types.Base
    , SomePersistField (..)
    , Update (..)
    , BackendSpecificUpdate
    , SelectOpt (..)
    , Filter (..)
    , BackendSpecificFilter
    , Key
    , Entity (..)
    , unHaskellNameForJSON
    ) where

import Database.Persist.Types.Base
import Database.Persist.Class.PersistField
import Database.Persist.Class.PersistEntity

import Data.Text (Text)

-- | This special-cases "type_" and strips out its underscore. When
-- used for JSON serialization and deserialization, it works around
-- <https://github.com/yesodweb/persistent/issues/412>
unHaskellNameForJSON :: HaskellName -> Text
unHaskellNameForJSON = fixTypeUnderscore . unHaskellName
  where fixTypeUnderscore "type_" = "type"
        fixTypeUnderscore name = name
