{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified App
import Web.Scotty
import System.Environment.MrEnv ( envAsInt )

main :: IO ()
main = do
  port <- envAsInt "PORT" 4400
  putStrLn "Starting Server...."
  scotty port App.app
