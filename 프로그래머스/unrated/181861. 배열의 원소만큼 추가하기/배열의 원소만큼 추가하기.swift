import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var answer = [Int]()
        
    for i in 0..<arr.count {
        for j in 0..<arr[i] {
            answer.append(arr[i])
        }
    }
    
    return answer
}