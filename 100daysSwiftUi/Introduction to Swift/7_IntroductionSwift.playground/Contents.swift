import Cocoa

var greeting = "Hello, playground"

// Classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Class inheritance
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) a day")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will work \(hours) a day")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// Initializers
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// Copy classes
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// Deinitializer
class User1 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id). I'm alive!")
    }
    
    deinit {
        print("User \(id). I'm dead!")
    }
}

var users = [User1]()
for i in 1...3 {
    let user = User1(id: i)
    print("User \(user.id). I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// Variables
class User2 {
    var name = "Paul"
}

var user = User2()
user.name = "Taylor"
user = User2()
print(user.name)

// Checkpoint 7
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Au au")
    }
    
    init() {
        super.init(legs: 4)
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Auu auu")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Auuu auuu")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    func speak() {
        print("Miau")
    }
    
    init(isTame: Bool) {
        self.isTame = isTame
        
        super.init(legs: 4)
    }
}

final class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    
    override func speak() {
        print("Miauu")
    }
}

final class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
    
    override func speak() {
        print("Miauuu")
    }
}

let poodle = Poodle()
poodle.speak()
let corgi = Corgi()
corgi.speak()
let persian = Persian()
persian.speak()
let lion = Lion()
lion.speak()
