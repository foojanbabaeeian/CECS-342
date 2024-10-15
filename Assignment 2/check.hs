sortList :: (a -> a -> Bool) -> [a] -> [a]
sortList _ [] = []
sortList cmp (x : xs) = insert cmp x (sortList cmp xs)
  where
    insert _ y [] = [y]
    insert cmp y (z : zs)
      | cmp y z = y : z : zs
      | otherwise = z : insert cmp y zs

numbers :: [Float]
numbers =
  [ 645.41,
    37.59,
    76.41,
    5.31,
    -34.23,
    1.11,
    1.10,
    23.46,
    635.47,
    -876.32,
    467.83,
    62.25
  ]

people :: [(String, Int)]
people =
  [ ("Hal", 20),
    ("Susann", 31),
    ("Dwight", 19),
    ("Kassandra", 21),
    ("Lawrence", 25),
    ("Cindy", 22),
    ("Cory", 27),
    ("Mac", 19),
    ("Romana", 27),
    ("Doretha", 32),
    ("Danna", 20),
    ("Zara", 23),
    ("Rosalyn", 26),
    ("Risa", 24),
    ("Benny", 28),
    ("Juan", 33),
    ("Natalie", 25)
  ]

-- Sort numbers in ascending order
sortNumbersAsc :: [Float] -> [Float]
sortNumbersAsc = sortList (<)

-- Sort people by name (alphabetically)
sortPeopleByName :: [(String, Int)] -> [(String, Int)]
sortPeopleByName = sortList (\(name1, _) (name2, _) -> name1 < name2)

-- Sort people by age (descending), with alphabetical tie-breaking
sortPeopleByAgeDesc :: [(String, Int)] -> [(String, Int)]
sortPeopleByAgeDesc = sortList cmp
  where
    cmp (name1, age1) (name2, age2)
      | age1 /= age2 = age1 > age2 -- Descending order of age
      | otherwise = name1 < name2 -- Tie-breaking by name

main :: IO ()
main = do
  putStrLn "Sorted Numbers (Ascending):"
  print (sortNumbersAsc numbers)

  putStrLn "\nPeople Sorted by Name (Alphabetically):"
  print (sortPeopleByName people)

  putStrLn "\nPeople Sorted by Age (Descending) and Name (Alphabetically):"
  print (sortPeopleByAgeDesc people)
