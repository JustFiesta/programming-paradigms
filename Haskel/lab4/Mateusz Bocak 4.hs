module Lists where

import Data.Char

-- 4.2.2 *

sum2 :: Num a => [a] -> a
sum2 xs = sum [x | (x, i) <- zip xs [0..], even i]

{-
ghci> sum2 [1,2,3,4,5,6]
9
-}


-- 4.2.3 *

sum3 :: Num a => [a] -> a
sum3 xs = sum [x | (x, i) <- zip xs [0..], i `mod` 3 == 0]

{-
ghci> sum3 [1,2,3,4,5,6,7,8,9,10]
22
-}


-- 4.3.2 *

countLowerUpper :: [Char] -> (Int, Int)
countLowerUpper str =
    let lowerCount = length [c | c <- str, isLower c]
        upperCount = length [c | c <- str, isUpper c]
    in (lowerCount, upperCount)
    
{-
ghci> countLowerUpper "Hello World!"
(8,2)
ghci> countLowerUpper "Test zadania 4.3.2 countLowerUpper"
(23,3)
-}


-- 4.4 *

string2bools :: [Char] -> [Bool]
string2bools str = [isLower c | c <- str]

{-
ghci> string2bools "Hello World!"
[False,True,True,True,True,False,False,True,True,True,True,False]
ghci> string2bools "Test zadania 4.4 string2bools"
[False,True,True,True,False,True,True,True,True,True,True,True,False,False,False,False,False,True,True,True,True,True,True,False,True,True,True,True,True]
-}


-- 4.5.2 *

cltx :: Ord a => a -> [a] -> Int
cltx x xs = length [y | y <- xs, y < x]

{-
ghci> cltx 5 [1,2,3,4,5,6,7,8,9,10]
4
-}


-- 4.5.4 *

ltx :: Ord a => a -> [a] -> [a]
ltx x xs = [y | y <- xs, y <= x]

{-
ghci> ltx 5 [1,2,3,4,5,6,7,8,9,10]
[1,2,3,4,5]
-}


-- 4.6 *

string2int :: Foldable t => t Char -> Int
string2int str = foldl (\acc c -> acc * 10 + digitToInt c) 0 str

{-
ghci> string2int "123"
123
ghci> string2int "00043"
43
ghci> string2int "92049"
92049
-}

