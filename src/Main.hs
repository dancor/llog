module Main where

import Data.Time
import System.Directory
import System.Environment
import System.FilePath

main :: IO ()
main = getArgs >>= \ args -> case args of
  [log, msg] -> do
    t <- getCurrentTime
    h <- getHomeDirectory
    let d = h </> "log"
    createDirectoryIfMissing True d
    appendFile (d </> log) $ show t ++ "\t" ++ show msg ++ "\n"
  _ -> error "usage"
