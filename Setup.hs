import Distribution.Simple
import System.IO
import System.Directory
import System.Environment
import Data.List
main = do
    --your
    (x:_) <- getArgs
    if x == "configure" then do
            dir <- getAppUserDataDirectory "GiveYouAHead"
            isE <- doesDirectoryExist dir
            if isE == True then putStrLn "" else createDirectory dir
            isE <- doesDirectoryExist (dir++"/data")
            if isE == True then putStrLn "" else createDirectory (dir++"/data")
            isE <- doesDirectoryExist (dir++"/data/language")
            if isE == True then putStrLn "" else createDirectory (dir++"/data/language")
            hD <- openFile (dir++"/data/delList.dat") ReadMode
            stSrc <- hGetLine hD
            hClose hD
            putStrLn stSrc
            writeFile (dir ++ "/data/delList.dat") (show$dropRepeated$sort((read stSrc ::[String])++dL))
            writeFile (dir ++ "/data/language/Haskell.cmap") (show langM)
            defaultMain
    --your end
        else
            defaultMain
    where
    langM = [
        ("*Template","\nmain = return ()\n"),
        ("*NoteMark","--"),
        ("*SrcAhead","Haskell_"),
        ("*SrcBack",".hs"),
        ("*COB",""),
        ("*COE",""),
        ("*ImportAhead","import "),
        ("*ImportBack","\n"), -- need break a new line
        ("*FE","hs"),
        ("*Compiler","ghc"),
        ("*Debug"," "),
        ("*Object","-o")
        ]
    dL = [
        "*.hs~",
        "*.hi",
        "*.o"
        ]


dropRepeated :: (Eq a)=> [a] -> [a]
dropRepeated [] = []
dropRepeated (x:[]) = [x]
dropRepeated (x:y:xs)
    | x == y = dropRepeated (x:xs)
    | otherwise = x:dropRepeated (y:xs)
