import Foundation

func solution(_ my_string:String) -> [String] {
    return my_string.split(separator: " ").map { String($0) }
}