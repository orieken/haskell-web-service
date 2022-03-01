{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Main (main) where

import qualified App
import Test.Hspec
import Test.Hspec.Wai

import Network.Wai  (Application)
import qualified Web.Scotty as S



main :: IO ()
main = hspec spec

api :: IO Application
api =  S.scottyApp App.app

spec :: Spec
spec = with api $ do
  describe "App.app" $ do
    describe "GET /" $ do
      it "should be 200" $ do
        get "/" `shouldRespondWith` 200
    describe "GET /users" $ do
      it "should be 200" $ do
        get "/users" `shouldRespondWith` 200
    xdescribe "GET /users/:id" $ do
      it "should be 200" $ do
        get "/users/1" `shouldRespondWith` 200