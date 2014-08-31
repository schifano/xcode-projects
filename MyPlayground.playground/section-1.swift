// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

println("Hello world")
println(str)

println("Meow")


// Simple Values
var myVariable = 42
println(myVariable)
let myConstant = 6
println(myConstant)

let myImplicitInteger = 70
println(myImplicitInteger)

let myImplicitDouble = 6.5
println(myImplicitDouble)

let explicitFloat: Float = 4
println(explicitFloat)

// Convert to another type

let label = "My favorite number is "
let number = 6
let favNumer = label + String(number)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let appleOranageSummary = "I have \(apples + oranges) apples and oranges."

let boyfriend = "Michal"
let greeting = "Hello \(boyfriend)!"

// Array

var DJlist = ["Ravine", "Cotts", "Skrillex"]
DJlist[0]
DJlist[1]

// Dictionary
var languages = [
    "C": "Programming",
    "C++": "Programming",
    "JavaScript": "Scripting",
    "Python": "Scripting"
]

languages["Perl"] = "Scripting"

let emptyArray = String[]()

let emptyDictionary2 = Dictionary<String,Integer>()

DJlist = []

let individualScores = [100,89,74,56,33,80,81,84,80]

var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
println(teamScore)

















