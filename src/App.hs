{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module App (app) where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty

data User = User { userId :: Int, userName :: String } deriving (Show, Generic)
instance ToJSON User
instance FromJSON User

matchesId :: Int -> User -> Bool
matchesId id user = userId user == id

bob :: User
bob = User { userId = 1, userName = "Bob" }
jenny :: User
jenny = User { userId = 3, userName = "Jenny" }

allUsers :: [User]
allUsers = [bob, jenny]

allU :: ActionM ()
allU = do
  json allUsers

hello :: ActionM ()
hello = do
  text "hello world! lll"

app :: ScottyM ()
app = do
  get "/" hello
  get "/users" allU
  get "/users/:id" $ do
    id <- param "id"
    json (filter (matchesId id) allUsers)