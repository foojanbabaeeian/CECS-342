-- CECS 342 "40 Haskell Expressions"

-- Evaluate each of the following 40 Haskell expressions.
-- Then use ghci (in repl.it) to verify the results.

x01 = 1 + 2

x02 = (+) 1 2

x03 = (-) 1 2

x04 = flip (-) 1 2

x05 = 1 : []

x06 = head [1, 2]

x07 = tail [1, 2]

x08 = 1 < 2

x09 = if 1 < 2 then "yes" else "no"

x10 = 'a' : "bc"

x11 = [1, 2] ++ [3, 4]

x12 = "ab" ++ "cd"

x13 = foldr (+) 0 [1, 2, 3]

x14 = foldr (-) 0 [1, 2, 3]

x15 = foldl (+) 0 [1, 2, 3]

x16 = foldl (-) 0 [1, 2, 3]

x17 = foldr (-) 7 [1, 2, 3]

x18 = map (2 *) [1 .. 10]

x19 = [2 * x | x <- [1 .. 10]]

x20 = take 3 [6, 5, 4, 3, 2, 1]

x21 = take 2 (map (2 *) [3, 4, 5])

x22 = take 2 $ map (2 *) [3, 4, 5]

x23 = take 2 $ (2 *) <$> [3, 4, 5]

x24 = foldr (++) [] [[1], [], [5, 7]]

x25 = foldr (++) "" ["a", "", "bc"]

x26 = max 1 2

x27 = 1 `max` 2

x28 = maximum [1, 5, 3]

x29 = flip (foldr (:)) "abc" "def"

x30 = foldl (flip (:)) [] [2, 4, 6]

x31 = sum [length s | s <- ["a", "b", "cd"]]

x32 = fst (1, "abc")

x33 = snd ([1, 2, 3], 'a')

x34 = curry fst 1 2

x35 = uncurry (+) (1, 2)

x36 = (\x -> 2 * x) 5

x37 = (\y -> y * y) 5

x38 = (\z -> 7) 5

x39 = (\x -> (\x -> x + 1) x) 5

x40 = (\f -> f (f 0)) (\x -> x + 1)
