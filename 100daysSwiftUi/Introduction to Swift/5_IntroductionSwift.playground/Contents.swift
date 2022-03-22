import Cocoa

// Create closures
func greetUser () {
    print("Hello, playground")
}
greetUser()
var greetCopy: () -> Void = greetUser
greetCopy()

let sayHello = {
    print("Hi there!")
}
sayHello()

let sayHi = { (name: String) -> String in
    "Hi \(name)!"
}
print(sayHi("Test"))

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

func capitanFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    } else {
        return name1 < name2
    }
}
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)
let capitanFirstTeam = team.sorted(by: capitanFirstSorted)
print(capitanFirstTeam)

let capitanFirstTeam1 = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    } else {
        return name1 < name2
    }
    
})
print(capitanFirstTeam1)

// Shorthand syntax
let sorted = team.sorted { a, b  in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    } else {
        return a < b
    }
    
}

let reverseTeam = team.sorted { $0 > $1 }
let tOnly = team.filter { $0.hasPrefix("T") }
let uppercaseTeam = team.map { $0.uppercased() }

// Accept functions
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let newRolls = makeArray(size: 5) { Int.random(in: 1...10) }
print(newRolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork{
    print("1")
} second: {
    print("2")
} third: {
    print("3")
}

// Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let noEven = luckyNumbers.filter { $0 % 2 != 0 }
let ascOrder = noEven.sorted { $0 < $1 }
let strLucky = ascOrder.map { "\($0) is a lucky number" }
strLucky.map { print($0) }

luckyNumbers.filter { $0 % 2 != 0 }
    .sorted { $0 < $1 }
    .map { "\($0) is a lucky number" }
    .map { print($0) }
