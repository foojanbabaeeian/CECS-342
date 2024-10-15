class Person:
    def __init__(self, name: str, age: int) -> None:
        self.name: str = name
        self.age: int = age

numbers: list[float] = [
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
]

people: list[Person] = [
    Person("Hal", 20),
    Person("Susann", 31),
    Person("Dwight", 19),
    Person("Kassandra", 21),
    Person("Lawrence", 25),
    Person("Cindy", 22),
    Person("Cory", 27),
    Person("Mac", 19),
    Person("Romana", 27),
    Person("Doretha", 32),
    Person("Danna", 20),
    Person("Zara", 23),
    Person("Rosalyn", 26),
    Person("Risa", 24),
    Person("Benny", 28),
    Person("Juan", 33),
    Person("Natalie", 25)
]

numbers.sort()
[print(f'{a}, ', end='') for a in numbers]
print()
print()

people.sort(key=lambda x: x.name)
[print(f'{a.name}, {a.age}; ', end='') for a in people]
print()
print()

people.sort(key=lambda x: x.age, reverse=True)
[print(f'{a.name}, {a.age}; ', end='') for a in people]
print()
print()
