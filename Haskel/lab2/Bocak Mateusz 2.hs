-- Homework 2


-- 2.6.5

f5 :: Int -> Bool
f5 x = x > 100

f5' :: Int -> Bool
f5' = (> 100)

{-
ghci> :l lab2 
[1 of 1] Compiling Lab2             ( lab2.hs, interpreted )
Ok, one module loaded.
ghci> f5 10     
False
ghci> f5 101
True
ghci> f5' 1
False
ghci> f5' 101
True
-}


-- 2.6.6

{-
ghci> :l lab2
[1 of 1] Compiling Lab2             ( lab2.hs, interpreted )
Ok, one module loaded.
ghci> f6 5
0
ghci> f6 6
5
ghci> f6' 5
0
ghci> f6' 6
5
ghci> f6'' 5
0
ghci> f6'' 6
5
-}


-- 2.6.7

f7 :: Int -> Int
f7 x = div 8 x

f7' :: Int -> Int
f7' x = 8 `div` x

f7'' :: Int -> Int
f7'' = (8 `div`)

{-
ghci> :l lab2
[1 of 1] Compiling Lab2             ( lab2.hs, interpreted )
Ok, one module loaded.
ghci> f7 8
1
ghci> f7 9
0
ghci> f7 16
0
ghci> f7 17
0
ghci> f7' 8 
1
ghci> f7' 9
0
ghci> f7'' 8 
1
ghci> f7'' 9
0
-}


-- 2.6.8

f8 :: Int -> Int
f8 x = 3 * x

f8' :: Int -> Int
f8' = (3 *)

{-
ghci> f8 3
9
ghci> f8' 3
9
-}


-- 2.7

{-
module Triangle where

import Prelude

-- Wzór Herona - pole trójkąta, gdy znamy długości trzech boków
trArea1 :: Floating a => a -> a -> a -> a
trArea1 a b c = sqrt (s * (s - a) * (s - b) * (s - c))
  where s = (a + b + c) / 2

-- Wzór podstawy i wysokości - pole trójkąta, gdy znamy podstawę i wysokość
trArea2 :: Floating a => a -> a -> a
trArea2 base height = 0.5 * base * height

-- Wzór w układzie współrzędnych - pole trójkąta, gdy znamy współrzędne wierzchołków
trArea3 :: (Num a, Ord a, Fractional a) => a -> a -> a -> a -> a -> a -> a
trArea3 x1 y1 x2 y2 x3 y3 = 0.5 * abs (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))
-}

{-
ghci> :l Triangle
[1 of 1] Compiling Triangle         ( Triangle.hs, interpreted )
Ok, one module loaded.
ghci> trArea1 3 4 5 
6.0
ghci> trArea2 4 5  
10.0
ghci> trArea3 0 0 4 0 0 3
6.0
-}


-- 3.1

f x | x < -10 = x*x

{-
*Math> f (-12)
144
*Math> f (-pi)
*** Exception: <interactive>:17:1-19: Non-exhaustive patterns in function f

*Math> f 1
*** Exception: <interactive>:17:1-19: Non-exhaustive patterns in function f

*Math> f 5
*** Exception: <interactive>:17:1-19: Non-exhaustive patterns in function f
-}

-- Task 1

f' x | x < -10 = x*x
     | -10 <= x && x < 0 = sin x
     | 0 <= x && x <= 2 = sqrt x
     | otherwise = undefined
     
{-
*Math> f' 10
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries\base\GHC\Err.hs:79:14 in base:GHC.Err
  undefined, called at lab3.hs:59:20 in main:Math
*Math> f' 2
1.4142135623730951
*Math> f' 0
0.0
*Math> f' 1
1.0
*Math> f' (-2)
-0.9092974268256817
*Math> f' (-10)
0.5440211108893698
*Math> f' (-9)
-0.4121184852417566
-}

{- Task 2 *

Define an analogous function f1'' without the use of logical operators.
-}

f'' x | x < -10    = x*x
      | x < 0      = sin x
      | x <= 2     = sqrt x
      | otherwise  = undefined

{-
ghci> :l lab3  
[1 of 1] Compiling Math             ( lab3.hs, interpreted )
Ok, one module loaded.
ghci> f'' (-10)
0.5440211108893698
ghci> f'' (1)  
1.0
ghci> f'' (2)
1.4142135623730951
ghci> f'' (3)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:89:22 in main:Math
ghci> f'' (4)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:89:22 in main:Math
ghci> f'' (5)
*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  undefined, called at lab3.hs:89:22 in main:Math
-}


-- 3.2

-- https://en.wikipedia.org/wiki/Binomial_coefficient

{-
*Math> :t div
div :: Integral a => a -> a -> a
*Math> :t (/)
(/) :: Fractional a => a -> a -> a
*Math> 6 `div` 4
1
*Math> 6 / 4
1.5
*Math> (6 :: Int) `div` (4 :: Int)
1
*Math> (6 :: Int) / (4 :: Int)

<interactive>:6:1: error:
    * No instance for (Fractional Int) arising from a use of `/'
    * In the expression: (6 :: Int) / (4 :: Int)
      In an equation for `it': it = (6 :: Int) / (4 :: Int)
-}

factorial :: Integer -> Integer
factorial n | n == 0 = 1
            | n > 0  = n * factorial (n - 1)

binomialCoefficient k n | k == 0 && k <= n = 1
                        | k > 0 && k <= n = factorial n `div` (factorial k * factorial (n - k))
                        | otherwise = 0
