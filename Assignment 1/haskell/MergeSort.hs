merge :: (Ord a) => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
  | x <= y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

-- Merge sort function
mergeSort :: (Ord a) => [a] -> [a]
mergeSort [] = [] -- Handle empty list case
mergeSort [x] = [x] -- Single element
mergeSort xs
  | containsInvalid xs = error "Invalid input!" -- Handle invalid input by error
  | otherwise = merge (mergeSort left) (mergeSort right)
  where
    mid = length xs `div` 2
    left = take mid xs
    right = drop mid xs

-- Check if any elements in the list are invalid
containsInvalid :: (Ord a) => [a] -> Bool
containsInvalid xs = any (== Nothing) (map validate xs)

-- A simple validation function.
validate :: (Ord a) => a -> Maybe a
validate x = Just x

main = print $ mergeSort [4, 1, 5, 2, 8, 3, 7, 6]