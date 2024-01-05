import Foundation

func solution(_ myString:String) -> [Int] {
    var array = myString.components(separatedBy: "x")
    var answer = Array(repeating: 0, count: array.count)
    
    for i in 0..<array.count {
        answer[i] = array[i].count
    }
    
    return answer
}