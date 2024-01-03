import Foundation

func solution(_ strArr:[String]) -> [String] {
    var answer = strArr
    
    for i in 0..<answer.count {
        if i % 2 == 0 {
            answer[i] = answer[i].lowercased()
        } else {
            answer[i] = answer[i].uppercased()
        }
    }
    
    return answer
}