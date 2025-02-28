module Math where

-- 3.1

-- slide 20/71

{-
This task illustrates how to use the if operator.
The general form for the | operator is as follows:

function parameters | condition = expression
-}

{-
*Math> not True
False
*Math> not True && False
False
*Math> True || False
*Math> let f1 x | x == 0 = "zero"
*Math> f1 0
"zero"
*Math> f1 1
"*** Exception: <interactive>:9:5-26: Non-exhaustive patterns in function f1
*Math> f2 0
"zero"
*Math> f2 1
"*** Exception: Prelude.undefined
CallStack (from HasCallStack):
  error, called at libraries\base\GHC\Err.hs:79:14 in base:GHC.Err
  undefined, called at <interactive>:12:40 in interactive:Ghci8
*Math> :t otherwise
otherwise :: Bool
*Math> otherwise
True
-}


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

-- 3.3 *

-- homework
