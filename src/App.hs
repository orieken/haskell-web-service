{-# LANGUAGE OverloadedStrings #-}
module App (app) where

import Network.Wai.Middleware.Cors
import Web.Scotty
import User
import Control.Monad.Trans (liftIO)
import qualified Data.ByteString.Lazy as B
import Data.Aeson (decode)

hello :: ActionM ()
hello = do
  text "hello world! lll"

jsonFile :: FilePath
jsonFile = "./src/users.json"

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

getUsers :: ActionM ()
getUsers = do
  usersFile <- liftIO getJSON 
  let users = (decode usersFile :: Maybe [User])
  json users

addUsers :: ActionM ()
addUsers = do
  users <- jsonData :: ActionM User
  liftIO $ print users
  json users

app :: ScottyM ()
app = do
  middleware simpleCors
  get "/" hello
  get "/users" getUsers
  post "/users" addUsers
