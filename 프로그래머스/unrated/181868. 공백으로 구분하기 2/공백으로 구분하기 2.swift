import Foundation

func solution(_ my_string:String) -> [String] {
    var answer = my_string.split(separator: " ").map { String($0) }
    
    return answer
}