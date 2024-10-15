import Data.List (sort, sortBy)
import Data.Ord (comparing)


numbers :: [Float]
numbers = [645.41, 37.59, 76.41, 5.31, -34.23, 1.11, 1.10, 
           23.46, 635.47, -876.32, 467.83, 62.25]

people :: [(String, Int)]
people = [("Hal", 20), ("Susann", 31), ("Dwight", 19), 
          ("Kassandra", 21), ("Lawrence", 25), ("Cindy", 22), 
          ("Cory", 27), ("Mac", 19), ("Romana", 27), ("Doretha", 32), 
          ("Danna", 20), ("Zara", 23), ("Rosalyn", 26), ("Risa", 24), 
          ("Benny", 28), ("Juan", 33), ("Natalie", 25)]
          
sortNumbers :: [Float] -> [Float]
sortNumbers = sort

sortPeopleByName :: [(String, Int)] -> [(String, Int)]
sortPeopleByName = sortBy (comparing fst)

sortPeopleByAgeDesc :: [(String, Int)] -> [(String, Int)]
sortPeopleByAgeDesc = sortBy (comparing (negate . snd) <> comparing fst)

main :: IO ()
main = do
    putStrLn "Sorted Numbers (Ascending):"
    print (sortNumbers numbers)

    putStrLn "\nPeople Sorted by Name (Alphabetically):"
    print (sortPeopleByName people)

    putStrLn "\nPeople Sorted by Age (Descending) and Name (Alphabetically):"
    print (sortPeopleByAgeDesc people)
