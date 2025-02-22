-- Homework 1


-- 1.2
{-
cd .\Haskel\lab1\
lab1> gcc .\pliki.c -o .\pliki
lab1> .\pliki
lab1> cat .\wynik.txt
81
-}


-- 1.4
{-
.jdks\openjdk-23\bin\java.exe "-javaagent:C:\Programy\IntelliJ IDEA Community Edition 2024.2.3\lib\idea_rt.jar=54375:C:\Programy\IntelliJ IDEA Community Edition 2024.2.3\bin" -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 -classpath C:\Users\Masti\Desktop\Programowanie\programming-paradigms\out\production\Java Main
Zawartość tablicy:
5 1 1 6 3 5 6 3 3 2 
Process finished with exit code 0
-}


-- 1.5
{-
import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        try {
            File inputFile = new File("liczby.txt");
            Scanner scanner = new Scanner(inputFile);
            FileWriter outputFile = new FileWriter("wynik.txt");
            
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            int c = a + b;
            
            outputFile.write(Integer.toString(c));
            
            scanner.close();
            outputFile.close();
        } catch (IOException e) {
            System.out.println("Wystąpił błąd: " + e.getMessage());
        }
    }
}
-}


-- 1.6
{-
Integer division truncated toward zero.
rem :: a -> a -> a |infixl 7|

gcd x y is the non-negative factor of both x and y of which every common factor of x and y is also a factor; for example gcd 4 2 = 2, gcd (-4) 6 = 2, gcd 0 4 = 4. gcd 0 0 = 0. (That is, the common divisor that is "greatest" in the divisibility preordering.)
gcd :: Integral a => a -> a -> a
-}



-- Task 4 *
{-
Integer division truncated toward zero.
rem :: a -> a -> a |infixl 7|

gcd x y is the non-negative factor of both x and y of which every common factor of x and y is also a factor; for example gcd 4 2 = 2, gcd (-4) 6 = 2, gcd 0 4 = 4. gcd 0 0 = 0. (That is, the common divisor that is "greatest" in the divisibility preordering.)
gcd :: Integral a => a -> a -> a
-}



-- 1.7/Task 6 *
{-
ghci> :l silnia
Ok, one module loaded.
ghci> silnia 4
24
ghci> main 
Podaj liczbę naturalną:
4
24
-}


-- 2.1/Task 2 *
{-
ghci> :info ()
type Num :: -> Constraint
class Num a where
  ...
  () :: a -> a -> a
  ...
        -- Defined in 'GHC.Num'
infixl 7

ghci> :info (/)
type Fractional :: * -> Constraint
class Num a => Fractional a where
  (/) :: a -> a -> a
  ...
        -- Defined in 'GHC.Real'
infixl 7 /

ghci> :info (^)
(^) :: (Num a, Integral b) => a -> b -> a       -- Defined in GHC.Real'
infixr 8 ^
-}


-- 2.2
{-
ghci> 113 'rem' 2
1
ghci> 113 'rem' 3
2

113 jest liczba pierwsza
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