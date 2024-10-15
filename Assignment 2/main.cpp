#include <string>
#include <vector>
#include <iostream>
#include <algorithm>
#include <iomanip>

using namespace std;

struct Person {
    string name;
    int age;
};

int main() {
    vector<double> numbers = {
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
    };

    vector<Person> people = {
        {"Hal", 20},
        {"Susann", 31},
        {"Dwight", 19},
        {"Kassandra", 21},
        {"Lawrence", 25},
        {"Cindy", 22},
        {"Cory", 27},
        {"Mac", 19},
        {"Romana", 27},
        {"Doretha", 32},
        {"Danna", 20},
        {"Zara", 23},
        {"Rosalyn", 26},
        {"Risa", 24},
        {"Benny", 28},
        {"Juan", 33},
        {"Natalie", 25}
    };
    
    sort(numbers.begin(), numbers.end());
    for (const double num: numbers) {
        cout << fixed << setprecision(2) << num << ", ";
    }
    cout << endl << endl;
    
    sort(
        people.begin(),
        people.end(),
        [](const Person& a, const Person& b) {
            return a.name < b.name;
        }
    );
    
    for (const Person person: people) {
        cout << person.name << ", " << person.age << "; ";
    }
    cout << endl << endl;

    sort(
        people.begin(),
        people.end(), 
        [](const Person& a, const Person& b) {
            if (a.age != b.age) {
                return a.age > b.age;
            }
            return a.name < b.name;
        }
    );
    for (const Person person: people) {
        cout << person.name << ", " << person.age << "; ";
    }
    cout << endl << endl;
}
