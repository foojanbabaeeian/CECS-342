-- QuickSortHaskell.hs
module QuickSortHaskell where

main :: IO ()

qs :: (Ord a) => [a] -> [a]
qs [] = []
qs (x:xs) = qs lo ++ [x] ++ qs hi
    where
        lo = filter (<= x) xs
        hi = filter (> x) xs


main = print $ qs [3, 6, 8, 10, 1, 9, 1, 7, 6, 5]
