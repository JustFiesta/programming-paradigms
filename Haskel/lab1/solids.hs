-- 2.4

sphereVolume :: Floating a => a -> a  -- obj kuli
sphereVolume r = 4/3 * pi * r^3

{-
ghci> sphereVolume 1
4.1887902047863905
-}

coneVolume :: Floating a => a -> a -> a  -- obj stozka
coneVolume r h = 1/3 * pi * r^2 * h

{-
ghci> coneVolume 1 2
2.0943951023931953
-}

{-
f11
ghci> :l solids
[1 of 2] Compiling Main             ( solids.hs, interpreted )
Ok, one module loaded.
-}