import Foundation

func solution(_ strArr:[String]) -> [String] {
    var answer = [String]()
    
    for str in strArr {
        if !str.contains("ad") {
            answer.append(str)
        }
    }
    
    return answer
}