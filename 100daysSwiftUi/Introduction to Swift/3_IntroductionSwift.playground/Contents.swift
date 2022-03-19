import Cocoa

var greeting = "Hello, playground"

// Conditions
let score = 85
if score > 80 {
    print("Great Job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country = "Canada"
if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"
if name != "Anonymous" {
    print("Welcome, \(name)!")
}

var username = "taylorswift13"
if username.isEmpty {
    username = "Anonymous"
}
print("Welcome, \(username)")

// Multiple conditions
let age1 = 16
if age1 >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let temp = 25
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game!")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane
if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in the traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// Switch statements
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

let place = "Metropolis"
switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary conditional operator
let age2 = 18
let canVote = age2 >= 18 ? "Yes" : "No"

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)

// For loop
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]
for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("\(j) x \(i) is \(j * i)")
    }
    
    print()
}

for i in 1...5 {
    print("Conting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Conting from 1 up to 5: \(i)")
}

var lyric = "Hater gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

// While
var countdown = 10
while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critial hit!")

// Skip loop
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if !filename.hasSuffix(".jpg") {
        continue
    }
    
    print("\(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()
for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)

// Checkpoint 3
let fizz = 3
let buzz = 5
for i in 1...100 {
    if i.isMultiple(of: fizz) && i.isMultiple(of: buzz) {
        print("FizzBuzz")
    } else if i.isMultiple(of: fizz) {
        print("Fizz")
    } else if i.isMultiple(of: buzz) {
        print("Buzz")
    } else {
        print(i)
    }
}
