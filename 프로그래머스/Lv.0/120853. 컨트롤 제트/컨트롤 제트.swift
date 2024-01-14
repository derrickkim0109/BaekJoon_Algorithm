import Foundation

func solution(_ s:String) -> Int {
    var answer = 0 
    var array = s.split(separator: " ").map { String($0) }
    var previousNum = 0
    print(array)
    
    for index in 0..<array.count {
        if array[index] == "Z" {
            answer -= previousNum
        } else {
            answer += Int(array[index])!
            previousNum = Int(array[index])!
        }
    }
    
    return answer
}