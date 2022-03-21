import Cocoa

var greeting = "Hello, playground"

// functions
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
        
    }
}

printTimesTable(number: 5, end: 20)

// return functions
func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

// multiple return functions
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

func getUser1() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user1 = getUser1()
print("Name: \(user1["firstName", default: "Anonymous"]) \(user1["lastName", default: "Anonymous"])")

func getUser2() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

let (firstName, lastName) = getUser2()
print("Name: \(firstName) \(lastName)")

// parameters labels
func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
let result1 = isUppercase(string)

func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) = \(i * number)")
    }
}
printTimesTable(for: 5)

// default values
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// handle errors
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "Ok"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

do {
    let string = "12345"
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// Checkpoint 4
enum squareRootErrors : Error {
    case tooLow, tooHigh, noRoot
}

func squareRoot(of num: Int) throws -> Int{
    if num < 0 { throw squareRootErrors.tooLow }
    if num > 1000 { throw squareRootErrors.tooHigh }
    
    for i in 1...100 {
        let root = i * i
        if root == num {
            return i
        }
    }
    
    throw squareRootErrors.noRoot
}

func safeSquareRoot(_ num: Int) {
    do {
        let result = try squareRoot(of: num)
        print("Result \(result)")
    } catch squareRootErrors.noRoot {
        print("No root was found")
    } catch squareRootErrors.tooLow {
        print("Number is too low")
    } catch squareRootErrors.tooHigh {
        print("Number is too high")
    } catch {
        print("Something wrong happened")
    }
}

safeSquareRoot(-1)
safeSquareRoot(1_000_000)
safeSquareRoot(2)
safeSquareRoot(25)
