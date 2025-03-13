module Lists where

import Data.Char

-- 4.2.1

-- slide 34/71

{-
Odd indexes are denoted with an asterisk.

           *     *
        0  1  2  3
list = [3, 5, 7, 9]
-}

{-
*Lists> let f0 (x:xs) = x
*Lists> let f1 (_:x:xs) = x
*Lists> let f2 (_:_:x:xs) = x
*Lists> f0 [3,5,7]
3
*Lists> f1 [3,5,7]
5
*Lists> f2 [3,5,7]
7
*Lists> f0 []
*** Exception: <interactive>:11:5-17: Non-exhaustive patterns in function f0
-}


sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs

{-
ghci> sum1 []
0
ghci> sum1 [3]
0
ghci> sum1 [3,5,7]
5
ghci> sum1 [3,5,7,9]
14
-}


-- 4.2.2 *


-- 4.2.3 *


-- 4.3.1

{-
ghci> :t "cat"
"cat" :: String
ghci> ['c', 'a', 't']
"cat"
ghci> 3 : [5,7]
[3,5,7]
ghci> :t (:)
(:) :: a -> [a] -> [a]
ghci> [3,5] ++ [7]
[3,5,7]
ghci> :t (++)
(++) :: [a] -> [a] -> [a]
ghci> "c" : "at"
ghci> 'c' : "at"
"cat"
ghci> "c" ++ "at"
"cat"
ghci> let small x = 'a' <= x && x <= 'z'
ghci> small 'c'
True
ghci> small 'X'
False
-}

countLower [] = 0
countLower (x:xs) | 'a' <= x && x <= 'z' = 1 + countLower xs
                  | otherwise = countLower xs

{-
ghci> countLower "kot"
3
ghci> countLower "Kot"
2
ghci> countLower "KoteczeK"
6
-}


-- 4.3.2 *


-- 4.4 *


-- 4.5.1

ctgx x [] = 0
ctgx x (y:ys) | x < y = 1 + ctgx x ys
              | otherwise = ctgx x ys

{-
ghci> ctgx 2 [1,2,3,4]
2
ghci> ctgx 3 [1,2,3,4,5]
2
-}

-- 4.5.2 *


-- 4.5.3

gtx x [] = []
gtx x (y:ys) | x < y = y : gtx x ys
             | otherwise = gtx x ys

gtx2 x [] = []
gtx2 x (y:ys) | x < y = [y] ++ gtx x ys
             | otherwise = gtx x ys

{-
ghci> gtx 3 [1,2,3,4,5]
[4,5]
ghci> gtx 2 [1,2,3,4,5]
[3,4,5]
ghci> gtx2 2 [1,2,3,4,5]
[3,4,5]
ghci> gtx2 3 [1,2,3,4,5]
[4,5]
-}


-- 4.5.4 *


-- 4.6

string2int x = read x :: Int

string2int2 (x:xs) = toInteger (read (x:xs))

string2int3 :: String -> Int
string2int3 x = read x

{-
ghci> string2int "11325"
11325
-}


-- 4.7

