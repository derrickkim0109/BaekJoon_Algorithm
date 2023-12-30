import Foundation

func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
    let startIndex = my_string.index(my_string.startIndex, offsetBy: s)
    let endIndex = my_string.index(my_string.startIndex, offsetBy: e)
    let lastIndex = endIndex != my_string.endIndex ? my_string.index(my_string.startIndex, offsetBy: e + 1) : endIndex

    let headString = startIndex != my_string.startIndex ? my_string[my_string.startIndex..<startIndex] : ""
    let targetString = my_string[startIndex...endIndex].map { String($0) }.reversed().joined()

    let tailString = endIndex != my_string.endIndex ? my_string[lastIndex...] : ""

    return headString + targetString + tailString
}