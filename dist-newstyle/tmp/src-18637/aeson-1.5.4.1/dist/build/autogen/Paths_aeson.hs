{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_aeson (
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
version = Version [1,5,4,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/theia/.cabal/store/ghc-8.10.1/aeson-1.5.4.1-bd73f4769d715bfbf998e685c39be8ed467800766eb13f55b3821ccdd83e260b/bin"
libdir     = "/home/theia/.cabal/store/ghc-8.10.1/aeson-1.5.4.1-bd73f4769d715bfbf998e685c39be8ed467800766eb13f55b3821ccdd83e260b/lib"
dynlibdir  = "/home/theia/.cabal/store/ghc-8.10.1/aeson-1.5.4.1-bd73f4769d715bfbf998e685c39be8ed467800766eb13f55b3821ccdd83e260b/lib"
datadir    = "/home/theia/.cabal/store/ghc-8.10.1/aeson-1.5.4.1-bd73f4769d715bfbf998e685c39be8ed467800766eb13f55b3821ccdd83e260b/share"
libexecdir = "/home/theia/.cabal/store/ghc-8.10.1/aeson-1.5.4.1-bd73f4769d715bfbf998e685c39be8ed467800766eb13f55b3821ccdd83e260b/libexec"
sysconfdir = "/home/theia/.cabal/store/ghc-8.10.1/aeson-1.5.4.1-bd73f4769d715bfbf998e685c39be8ed467800766eb13f55b3821ccdd83e260b/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "aeson_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "aeson_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "aeson_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "aeson_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aeson_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aeson_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
