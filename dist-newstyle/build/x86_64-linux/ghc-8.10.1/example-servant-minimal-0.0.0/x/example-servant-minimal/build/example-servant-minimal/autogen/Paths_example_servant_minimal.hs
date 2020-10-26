{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_example_servant_minimal (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/theia/.cabal/bin"
libdir     = "/home/theia/.cabal/lib/x86_64-linux-ghc-8.10.1/example-servant-minimal-0.0.0-inplace-example-servant-minimal"
dynlibdir  = "/home/theia/.cabal/lib/x86_64-linux-ghc-8.10.1"
datadir    = "/home/theia/.cabal/share/x86_64-linux-ghc-8.10.1/example-servant-minimal-0.0.0"
libexecdir = "/home/theia/.cabal/libexec/x86_64-linux-ghc-8.10.1/example-servant-minimal-0.0.0"
sysconfdir = "/home/theia/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "example_servant_minimal_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "example_servant_minimal_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "example_servant_minimal_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "example_servant_minimal_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "example_servant_minimal_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "example_servant_minimal_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
