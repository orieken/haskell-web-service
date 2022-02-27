{-# LANGUAGE OverloadedStrings #-}
module User where
import Data.Text.Lazy
import Data.Aeson

-- constructor
data User = User Integer Text Text Text Text Text
  deriving (Show)

instance FromJSON User where
  parseJSON (Object v) = User <$>
                          v .: "id"   <*>
                          v .: "name" <*>
                          v .: "status" <*>
                          v .: "species" <*>
                          v .: "gender" <*>
                          v .: "image"

instance ToJSON User where
  toJSON (User id name status species gender image) =
    object [
      "id" .= id,
      "name" .= name,
      "status" .= status,
      "species" .= species,
      "gender" .= gender,
      "image" .= image
    ]