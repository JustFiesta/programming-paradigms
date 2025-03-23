-- 5.2

{-
ghci> :t (/)
(/) :: Fractional a => a -> a -> a
ghci> (3 :: Float) / (5 :: Int)

<interactive>:35:17: error:
    * Couldn't match expected type `Float' with actual type `Int'
    * In the second argument of `(/)', namely `(5 :: Int)'
      In the expression: (3 :: Float) / (5 :: Int)
      In an equation for `it': it = (3 :: Float) / (5 :: Int)
      
ghci> (3 :: Float) / (5 :: Int)

<interactive>:41:17: error:
    * Couldn't match expected type `Float' with actual type `Int'
    * In the second argument of `(/)', namely `(5 :: Int)'
      In the expression: (3 :: Float) / (5 :: Int)
      In an equation for `it': it = (3 :: Float) / (5 :: Int)
ghci> (3 :: Float) * (5 :: Int)

<interactive>:42:17: error:
    * Couldn't match expected type `Float' with actual type `Int'
    * In the second argument of `(*)', namely `(5 :: Int)'
      In the expression: (3 :: Float) * (5 :: Int)
      In an equation for `it': it = (3 :: Float) * (5 :: Int)
      
ghci> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
ghci> (3 :: Float) / fromIntegral (5 :: Int)
0.6
ghci> fromIntegral (3 :: Int) * (5 :: Float)
15.0
-}

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule f a b n = h * sum [f x | x <- points]
  where
    h = (b - a) / fromIntegral(n)
    points = [a + fromIntegral(i) * h | i <- [1 .. n]]
    

integral1 = rectangleRule sin 0 pi 100
integral1' = rectangleRule sin 0 pi 1000
      
{-
ghci> integral1
1.9998356
ghci> integral1'
1.9999988
-}

integral2 = rectangleRule sqrt 0 1 100
integral2' = rectangleRule sqrt 0 1 1000
      
{-
ghci> integral2
0.6714629
ghci> integral2'
0.6671604
-}

integral3 = rectangleRule (^2) 0 1 100
integral3' = rectangleRule (^2) 0 1 1000

{-
ghci> integral3
0.33835
ghci> integral3'
0.33383355
-}

integral4 = rectangleRule (\x -> (x^3 + 2*x)) 0 2 100
integral4' = rectangleRule (\x -> (x^3 + 2*x)) 0 2 1000

{-
ghci> integral4
8.120399
ghci> integral4'
8.012006
-}