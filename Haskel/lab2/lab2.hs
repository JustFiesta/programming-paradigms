module Lab2 where

-- 2.1

{-
ghci> 2^100 / (12+23)*(40-21)
6.881531829810388e29
ghci> 2^100 / ((12+23)*(40-21))
1.9062415041026007e27
ghci> sqrt 2
1.4142135623730951
ghci> sqrt ((12+23)*(40-21))
25.787593916455254
ghci> 2+ -3

<interactive>:6:1: error:
    Precedence parsing error
        cannot mix `+' [infixl 6] and prefix `-' [infixl 6] in the same infix expression
ghci> 2+(-3)
-1
-}

{- Task 1

Check the associativity and the strength of binding for + and - operators.
-}


{-
ghci> :i +
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 +
ghci> :i -
type Num :: * -> Constraint
class Num a where
  ...
  (-) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 -
-}

-- 2.2

{-
ghci> rem 1234 2
0
ghci> 1234 `rem` 3
1
ghci> rem 1234 4
2
-}


-- 2.3

{-
ghci> :t pi
pi :: Floating a => a
ghci> pi
3.141592653589793
ghci> let f x = 2*x + 1
ghci> f 5
11

ghci> let sphereVolume r = 4/3 * pi * r^3
ghci> sphereVolume 1
4.1887902047863905

ghci> let coneVolume r h = 1/3 * pi * r^2 * h
ghci> coneVolume 1 2
2.0943951023931953
-}


-- 2.3.3
{-
ghci> let cuboidVolume l w h = lwh
ghci> cuboidVolume 3 4 5
60
-}


-- 2.5
{-
pyramidVolume :: Floating a => a -> a -> a  --objetosc ostroslupa
pyramidVolume base sideHeight =  1/3 * base * base * sideHeight

ghci> :l solids
[1 of 2] Compiling Main             ( solids.hs, interpreted )
Ok, one module loaded.
ghci> pyramidVolume 4 9
48.0
-}


-- 2.6

-- slides 10-11/71

-- we do not define module Math

{-
g1 x = mod 12 x
g2 = mod 12        -- g2 is equivalent to g1, partial application of mod

h1 x = mod x 12    -- we cannot omit parameter x here
h2 x = x `mod` 12  -- function mod is written as operator `mod`
h3 = (`mod` 12)    -- h3 is equivalent to h1 and h2, right section for `mod`
-}

{-
*Main> (2^) 3
8
*Main> (^ 2) 3
9
-}

f1 x = x - 2
f1' x = x + (-2) -- funkcje r�wnowa�ne -> ta sama dziedzina, ta sama przeciwdziedzina i to samo wzorowanie
f1'' = (+ (-2))

{-
*Main> f1 5
3
*Main> f1' 5
3
*Main> f1'' 5
3
-}

f2 x = rem x 5
f2' x = x `rem` 5 -- cos z sekcjami
                  -- jezeli x po lewej i prawej mozna zamienic na sekcje?
                  -- sekcja - zapis jakis tam dla funkcji inflixowych
f2'' = (`rem` 5)

{-
*Main> f2 5
0
*Main> f2' 5
0
*Main> f2'' 5
0
-}

f3 x = x == 10
f3' = (== 10)

{-
*Main> f3 10
True
*Main> f3 9
False
*Main> f3' 9
False
*Main> f3' 10
True
-}

f4 x = div x 8
f4' x = x `div` 8
f4'' = (`div` 8)

{-
*Main> f4 8
1
*Main> f4' 16
2
*Main> f4'' 17
2
-}


-- 2.6.5 - 2.6.8 - Homework

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

f6 :: Int -> Int
f6 x = mod 5 x -- tradycyjny zapis programistyczny


f6' :: Int -> Int
f6' x = 5 `mod` x -- zapis pośredni za pomocą operatora `mod` - ktory jest inflixowy

f6'' :: Int -> Int
f6'' = (5 `mod`) -- zapis z sekcjami - jeżeli po obu stronach jest agrument to można go pominąć i utworzyć funkcje jednoargumentową z zapisem sekcji

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

-- zapis w osobnym pliku/module - Triangle.hs

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