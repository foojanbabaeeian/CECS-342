# Assignment 2
In this assignment, you will use 5 different programming languages to solve the same problem:
Use a generic sort function to sort values of different types. The values to sort could be integers, ﬂoating point numbers, strings, pairs of values (say a string and a number), or any other type of values that can be compared.
Write a console application in each of these 5 languages: C, C++, C#, Python and Haskell.
Each application has to use the following data:
The following sequence of ﬂoating point numbers:
645.41, 37.59, 76.41, 5.31, -34.23, 1.11, 1.10, 23.46, 635.47, -876.32, 467.83, 62.25
The following sequence of people with name and age of each person. The name is a string and the age an integer:
Hal, 20; Susann, 31; Dwight, 19; Kassandra, 21; Lawrence, 25; Cindy, 22; Cory, 27; Mac, 19; Romana, 27; Doretha, 32; Danna, 20; Zara, 23; Rosalyn, 26; Risa, 24; Benny, 28; Juan, 33; Natalie, 25
Use appropriate data structures to represent the data above in each of the 5 languages and deﬁne the variables numbers and people, respectively.
Find generic sort functions for each of the 5 languages.
You don't need to write your own generic sort functions, but should rather just use the generic sort functions provided by the respective language.
C doesn’t really provide generics. However, a void* can be used to point to any value.
One way to specify an order on a type is to deﬁne a comparison function that compares two values. This comparison function could be an argument to your sort function. Some languages might provide predeﬁned comparison functions.
Try to use everything we learned about these different programing languages, e.g., Python uses duck-typing, Haskell uses the type-class Ord to express order on a type, LINQ in C# includes the orderby operator, etc.
Use the generic sort functions of each language to
sort numbers ascending by numerical value,
sort people alphabetically (lexicographically) by name, and to
sort people descending by age, where people of the same age should be sorted alphabetically (lexicographically).
The point here is to reuse as much code as possible to perform all 3 different sort operations. Try to isolate the speciﬁc code that is needed for each of the three tasks.
Write a main function in each of the 5 languages to test your code by writing the sort results to the console.


#### Usage

python main.py > out.txt && diff out.txt ans.txt

dotnet run > out.txt && diff out.txt ans.txt

gcc main.c && ./a.out > out.txt && diff out.txt ans.txt

c++ main.cpp && ./a.out > out.txt && diff out.txt ans.txt

ghc -o check check.hs > ./check

