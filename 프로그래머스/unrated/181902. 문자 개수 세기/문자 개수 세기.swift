import Foundation

func solution(_ my_string:String) -> [Int] {
    var upperCaseArray = Array(repeating: 0, count: 26)
    var lowerCaseArray = Array(repeating: 0, count: 26)

    for char in my_string {
        if char.isLetter {
            let index = char.asciiValue!
            let startChar = (char.isUppercase) ? UInt8(UnicodeScalar("A").value) : UInt8(UnicodeScalar("a").value)
            let position = Int(index - startChar)

            if char.isUppercase {
                upperCaseArray[position] += 1
            } else {
                lowerCaseArray[position] += 1
            }
        }
    }

    return upperCaseArray + lowerCaseArray
}