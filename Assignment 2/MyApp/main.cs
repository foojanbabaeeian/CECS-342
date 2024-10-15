namespace assignment_2
{
    public struct Person(string name, int age)
    {
        public string Name { get; set; } = name;
        public int Age { get; set; } = age;
    }
    
    class Assignment2
    {
        static void Main()
        {
            List<double> numbers = [
                645.41,
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
            ];

            List<Person> people = [
                new Person("Hal", 20),
                new Person("Susann", 31),
                new Person("Dwight", 19),
                new Person("Kassandra", 21),
                new Person("Lawrence", 25),
                new Person("Cindy", 22),
                new Person("Cory", 27),
                new Person("Mac", 19),
                new Person("Romana", 27),
                new Person("Doretha", 32),
                new Person("Danna", 20),
                new Person("Zara", 23),
                new Person("Rosalyn", 26),
                new Person("Risa", 24),
                new Person("Benny", 28),
                new Person("Juan", 33),
                new Person("Natalie", 25)
            ];
            
            List<double> sortedNumbers = numbers
                .OrderBy(n => n)
                .ToList();
            sortedNumbers.ForEach(n => Console.Write($"{n}, "));
            Console.WriteLine();
            Console.WriteLine();

            List<Person> sortedPeople = people
                .OrderBy(p => p.Name)
                .ToList();
            sortedPeople.ForEach(p => Console.Write($"{p.Name}, {p.Age}; "));
            Console.WriteLine();
            Console.WriteLine();

            sortedPeople = people
                .OrderByDescending(p => p.Age)
                .ThenBy(p => p.Name)
                .ToList();
            sortedPeople.ForEach(p => Console.Write($"{p.Name}, {p.Age}; "));
            Console.WriteLine();
            Console.WriteLine();
        }
    }
}
