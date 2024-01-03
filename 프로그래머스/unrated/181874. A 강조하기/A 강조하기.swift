import Foundation

func solution(_ myString:String) -> String {
    var array = myString.map { String($0) }
    var answer = ""
    
    for i in 0..<array.count {
        if array[i] == "a" || array[i] == "A" {
            answer += array[i].uppercased()
        } else {
            answer += array[i].lowercased()
        }
    }
    
    return answer
}