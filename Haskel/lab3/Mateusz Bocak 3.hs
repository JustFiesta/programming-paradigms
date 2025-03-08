-- 3.3

factorial2 :: Integer -> Integer
factorial2 0 = 1
factorial2 1 = 1
factorial2 n = n * factorial2(n - 2)

{-
ghci> factorial2 0
1
ghci> factorial2 1
1
ghci> factorial2 2
2
ghci> factorial2 5
15
-}

-- Task 3

seq' 1 = 3
seq' 2 = 4
seq' n =  0.5 * seq' (n - 1) + 2 * seq' (n-2)

seq'' n | n == 1 = 3
        | n == 2 = 4
        | n > 2 = 0.5 * seq'' (n - 1) + 2 * seq'' (n-2)
        
{-
ghci> seq' 1
3.0
ghci> seq' 2
4.0
ghci> seq' 5
22.0

ghci> seq'' 1
3.0
ghci> seq'' 2
4.0
ghci> seq'' 5
22.0
-}

-- 3.6

gcd' a b | a == b = a
         | a > b = gcd'(a - b) b
         | otherwise = gcd' a (b - a)
         
{-
ghci> gcd 10 2
2
ghci> gcd' 10 2
2
ghci> gcd' 101 11
1
ghci> gcd 101 11
1
ghci> gcd 16 8
8
ghci> gcd' 16 8
8
-}

-- 3.8

infixr 6 +.
(+.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a,b) +. (c,d) = (a+c, b+d)

infixr 6 -.
(-.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a,b) -. (c,d) = (a-c, b-d)

infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a,b) *. (c,d) = (a*c - b*d, a*d + b*c)

re :: (Double, Double) -> Double
re (a,b) = a

im :: (Double, Double) -> Double
im (a,b) = b

{-
ghci> (2,3) +. (4,5)
(6.0,8.0)
ghci> (4,5) -. (2,3)
(2.0,2.0)
ghci> (1,2) *. (4, 4)
(-4.0,12.0)
ghci> re (2, 3)
2.0
ghci> im (2, 3)
3.0
-}

-- 3.9

(+..) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
(a,b,c) +.. (d,e,f) = (a+d, b+e, c+f)

(-..) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double, Double)
(a,b,c) -.. (d,e,f) = (a-d, b-e, c-f)

(*..) :: (Double, Double, Double) -> (Double, Double, Double) -> Double
(a,b,c) *.. (d,e,f) = a * d + b * e + c * f

(***) :: (Double, Double, Double) -> (Double, Double, Double) -> (Double, Double ,Double)
(a,b,c) *** (d,e,f) = (b * f - c * e, d * c - a * f, a * e - b * d)

{-
ghci> (1, 2, 3) +.. (3, 2, 1)
(4.0,4.0,4.0)
ghci> (1, 2, 3) -.. (3, 2, 1)
(-2.0,0.0,2.0)
ghci> (1, 2, 3) *.. (3, 2, 1)
10.0
ghci> (1, 2, 3) *** (3, 2, 1)
(-4.0,8.0,-4.0)
-}