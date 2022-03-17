import Cocoa

var greeting = "Hello, playground"

// Type annotations
let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

let username: String
// Lots of complex logic
username = "@towstraws"
// Lots more complex logic
print(username)

// Checkpoint 2
var arr = [ "Popcorn 2022", "Test", "Test", "abc" ]
print(arr.count)
var unique = Set(arr)
print(unique.count)
