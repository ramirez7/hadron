{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Hadron.Logger
    ( module Hadron.Logger
    , module Katip
    ) where

-------------------------------------------------------------------------------
import           Control.Monad.Trans
import           Data.IORef
import           Katip
import           System.IO
import           System.IO.Unsafe
-------------------------------------------------------------------------------


runLog :: MonadIO m => KatipT m b -> m b
runLog m = liftIO (readIORef _ioLogger) >>= flip runKatipT m



-------------------------------------------------------------------------------
_ioLogger :: IORef LogEnv
_ioLogger = unsafePerformIO $ do
  le <- initLogEnv "hadron" "-"
  hSetBuffering stderr LineBuffering
  s <- mkHandleScribe ColorIfTerminal stderr InfoS V3
  newIORef $ registerScribe "stderr" s le
{-# NOINLINE _ioLogger #-}


