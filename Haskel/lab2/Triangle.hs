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
