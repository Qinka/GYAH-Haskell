import Distribution.Simple
import System.IO
import System.Directory
main = do
    --your
    dir <- getAppUserDataDirectory "GiveYouAHead"
    isE <- doesDirectoryExist dir
    if isE == True then putStrLn "" else createDirectory dir
    isE <- doesDirectoryExist (dir++"/data")
    if isE == True then putStrLn "" else createDirectory (dir++"/data")
    isE <- doesDirectoryExist (dir++"/data/language")
    if isE == True then putStrLn "" else createDirectory (dir++"/data/language")
    writeFile (dir ++ "/data/language/Haskell.cmap") (show langM)
    --your end
    defaultMain
    where
    langM = [
        ("*Template","main = return ()\n"),
        ("*NoteMark","--"),
        ("*SrcAhead","Haskell_"),
        ("*SrcBack",".hs"),
        ("*COB",""),
        ("*COE",""),
        ("*ImportAhead","import "),
        ("*ImportBack","\n"), -- need break a new line
        ("*FE",".hs"),
        ]
