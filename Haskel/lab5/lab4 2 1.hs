module Lists where

import Data.Char


-- 4.7

{-
ghci> :t sum
sum :: (Foldable t, Num a) => t a -> a
ghci> :t product
product :: (Foldable t, Num a) => t a -> a
ghci> sum [1,3,5]
9
ghci> product [1,3,5]
15
ghci> [1..5]
[1,2,3,4,5]
ghci> [n | n <- [1..5]]
[1,2,3,4,5]
-}

-- 4.7.1

{-
suma1 = 1 + 1/2 + 1/3 + ... + 1/100
-}

suma1 = sum (map (1/) [1..100])

{-
ghci> suma1
5.187377517639621
-}

suma1' = sum (map (\ x -> 1/x) [1..100])

{-
ghci> suma1'
5.187377517639621
-}

suma1'' = sum [1/x | x <- [1..100]]

{-
ghci> suma1''
5.187377517639621
-}

-- 4.7.2
{-
iloczyn1 =(1+n) / (2+n)
-}

iloczyn1 = product (map (\y -> (1+y)/(2+y)) [1..50])

{-
ghci> iloczyn1
3.846153846153846e-2
-}

iloczyn1' = product [(1+y)/(2+y) | y <- [1..50]]

{-
ghci> iloczyn1'
3.846153846153846e-2
-}

iloczyn1'' = foldl (*) 1 [(1+y)/(2+y) | y <- [1..50]]

{-
ghci> iloczyn1''
3.846153846153846e-2
-}


-- 4.8

-- 4.8.1

factors :: Integer -> [Integer]
factors n = [x | x <- [1..n], n `mod` x == 0]

{- 
ghci> factors 28
[1,2,4,7,14,28]
-}

-- 4.8.2

prime :: Integer -> Bool
prime n = factors n == [1, n]

{- 
ghci> prime 7
True
ghci> prime 10
False
-}

-- 4.8.3

primes :: [Integer]
primes = filter prime [2 ..]

{- 
ghci> take 10 primes
[2,3,5,7,11,13,17,19,23,29]
-}

-- 4.8.4

pairs :: [Integer] -> [(Integer, Integer)]
pairs (x:y:[])  | x + 2 == y = [(x,y)]
                | otherwise  = []
pairs (x:y:xys) | x + 2 == y = (x,y) : pairs (y:xys)
                | otherwise  = pairs (y:xys)
pairs _ = []

{- 
ghci> pairs [1, 3, 4, 5, 7, 9, 11, 13]
[(1,3),(5,7),(7,9),(11,13)]
-}


