import Cocoa

var greeting = "Hello, playground"

// Create Variables and Constants
var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"

// Create strings
let actor = "Denzel Washington"

let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let movie = """
A day in
the life of an
Apple engineer
"""

let nameLength = actor.count
print(nameLength)

print(result.uppercased())

print(movie.hasPrefix("A day"))

print(filename.hasSuffix(".jpg"))

// Create whole numbers
let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

// Create decimal numbers
let decimal = 0.1 + 0.2
print(decimal)

let a = 1
let b = 2.0
let c = a + Int(b)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var n = "Nicholas Cage"
n = "John Travolta"

var rating = 5.0
rating *= 2

// Create booleans
let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Combine strings
let firstPart = "Hello, "
let secondPart = "world!"
let greetings = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote1 = "Then he tapped a sign saying \"Believe\" and walked away"

let name1 = "Taylor"
let age = 26
let message = "Hello, my name is \(name1) and I'm \(age) years old."

let number2 = 11
let missionMessage = "Apollo \(number2) landed on the moon."

print("5 x 5 is \(5 * 5)")

// Checkpoint 1
let temperature = 13
let temperatureF = temperature * 9 / 5 + 32
print("Temperature: \(temperature)°C / \(temperatureF)°F")
