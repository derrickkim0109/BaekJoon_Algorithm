import Foundation
let input = readLine()!
var stack = ""

for char in input {
    if char == "(" {
        stack.append(char)
    } else if char == ")" {
        while !stack.isEmpty && stack.last != "(" {
            print(stack.removeLast(), terminator: "")
        }

        stack.removeLast()
    } else if (char == "*" || char == "/") {
        while !stack.isEmpty && (stack.last == "*" || stack.last == "/") {
            print(stack.removeLast(), terminator: "")

        }

        stack.append(char)
    } else if (char == "+" || char == "-") {
        while !stack.isEmpty && stack.last != "(" {
            print(stack.removeLast(), terminator: "")
        }

        stack.append(char)
    } else {
        print(char,terminator: "")
    }
}

while !stack.isEmpty {
    print(stack.removeLast(),terminator: "")
}
