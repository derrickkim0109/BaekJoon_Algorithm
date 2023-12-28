import Foundation

func solution(_ my_strings:[String], _ parts:[[Int]]) -> String {
    var answer = ""
    
    for (index, part) in parts.enumerated() {
        let s = part[0]
        let e = part[1]
        let string = my_strings[index]
        let startIndex = string.index(string.startIndex, offsetBy: s)
        let endIndex = string.index(string.startIndex, offsetBy: e)
     
        answer += string[startIndex...endIndex]
    }
    
    return answer
}