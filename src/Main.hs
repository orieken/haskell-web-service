{-# LANGUAGE OverloadedStrings, DeriveGeneric #-}
module Main where

import qualified App
import Web.Scotty

main :: IO ()
main = do
  putStrLn "Starting Server...."
  scotty 4000 App.app
