module Lists where

import Data.Char


-- 4.7.3
suma3 = sum [1 / (i^2) | i <- [1..100]]

{- 
ghci> suma3   
1.6349839001848923
-}


-- 4.7.4
suma4 = sum [(sqrt i) - (1/i) | i <- [1..100]]

{- 
ghci> suma4   
666.2755695855082
-}


-- 4.7.5
iloczyn5 = product [(i+1) / (i^3) | i <- [1..50]]

{- 
ghci> iloczyn5
5.513411796832546e-128
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
[(1,3),(5,7),(7,9),(9,11),(11,13)]
-}


-- 4.8.5

primePairs :: [(Integer, Integer)]
primePairs = pairs primes

{- 
ghci> take 10 primePairs
[(3,5),(5,7),(11,13),(17,19),(29,31),(41,43),(59,61),(71,73),(101,103),(107,109)]
-}


-- 4.8.6

primeTriples :: [(Integer, Integer, Integer)]
primeTriples = [(x, y, z) | (x, y) <- primePairs, (y, z) <- primePairs]

{- 
ghci> take 5 primeTriples
[(3,3,5),(3,5,7),(3,11,13),(3,17,19),(3,29,31)]
-}


-- 5.1

cubeRoot :: (Floating a, Ord a) => a -> a -> a
cubeRoot x eps = iterateUntil (\y -> abs (y^3 - x) <= eps) improveGuess (x / 3)
  where
    improveGuess y = (1/3) * (2 * y + x / (y^2))

iterateUntil :: (a -> Bool) -> (a -> a) -> a -> a
iterateUntil cond f y
  | cond y    = y
  | otherwise = iterateUntil cond f (f y)

{- 
ghci> cubeRoot 27 0.0001
3.000000068671529
ghci> cubeRoot 8 0.0001
2.000000001547673
ghci> cubeRoot 125 0.0001
5.000000000150423
ghci> cubeRoot (-8) 0.0001
-2.000000001547673
-}

