-- Helper function to merge two sorted lists
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

-- Tree-like fold function
foldt :: (a -> a -> a) -> a -> [a] -> a
foldt _ z [] = z
foldt _ _ [x] = x
foldt f z xs = foldt f z (pairs f xs)

-- Helper function to combine elements in pairs
pairs :: (a -> a -> a) -> [a] -> [a]
pairs f (x:y:rest) = f x y : pairs f rest
pairs _ rest = rest

-- Mergesort implementation using foldt
mergesort :: (Ord a) => [a] -> [a]
mergesort xs = foldt merge [] [[x] | x <- xs]

-- Test cases
main :: IO ()
main = do
    -- Basic test cases
    print $ mergesort [4, 3, 1, 5, 2] -- Expected: [1, 2, 3, 4, 5]
    print $ mergesort [10, -1, 3, 7, 6, 8] -- Expected: [-1, 3, 6, 7, 8, 10]
    print $ mergesort [1] -- Expected: [1]
    print $ mergesort ([] :: [Int]) -- Explicitly specify type for empty list
    
    -- Edge case: already sorted list
    print $ mergesort [1, 2, 3, 4, 5] -- Expected: [1, 2, 3, 4, 5]
    
    -- Edge case: reverse sorted list
    print $ mergesort [5, 4, 3, 2, 1] -- Expected: [1, 2, 3, 4, 5]
    
    -- Edge case: list with repeated elements
    print $ mergesort [5, 3, 3, 2, 1, 5, 2] -- Expected: [1, 2, 2, 3, 3, 5, 5]
