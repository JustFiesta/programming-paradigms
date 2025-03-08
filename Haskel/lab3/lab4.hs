module Lists where

import Data.Char

-- 4.1.1

{-
ghci> :t map
map :: (a -> b) -> [a] -> [b]
ghci> map (^2) [1,3,5]
[1,9,25]
ghci> map (\x -> x*x) [1,3,5]
[1,9,25]
ghci> let f = (^2) in map f [1,3,5]
[1,9,25]
ghci> sum [1,3,5]
9
ghci> sqrt (sum [1,3,5])
3.0
-}

sumOfSquares' x = sum(map (^2) x)

{-
ghci> sumOfSquares' [1,3,5]
35
-}

-- 4.1.2

{-
ghci> :t (:)
(:) :: a -> [a] -> [a]
ghci> 3:[]
[3]
ghci> 3:5:[]
[3,5]
ghci> 3:[5]
[3,5]
ghci> let f (x:xs) = (x, xs)
ghci> f [3,5,7]
(3,[5,7])
-}

sumOfSquares [] = 0
sumOfSquares (x:xs) = x^2 + sumOfSquares xs

{-
ghci> sumOfSquares [1,3,5]
35
-}

-- 4.2.1

{-
ghci> let f0 (x:xs) = x
ghci> let f1 (_:x:xs) = x
ghci> let f2 (_:_:x:xs) = x
ghci> f0 [3,5,6]
3
ghci> f1 [3,5,6]
5
ghci> f2 [3,5,6]
6

ghci> f0 []
*** Exception: <interactive>:110:5-17: Non-exhaustive patterns in functi
-}

sum1 :: Num a => [a] -> a
sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs

{-
ghci> sum1 []
0
ghci> sum1 [3]
0
ghci> sum1 [3,5]
5
ghci> sum1 [3,5,7,9]
14
-}

-- 4.3.1

{-
ghci> :t "cat"
"cat" :: String
ghci> ['c','a','t']
"cat"
ghci>  3 : [5,7]
[3,5,7]
ghci> [3,5] ++ [7]
[3,5,7]
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

countLower x = ...
