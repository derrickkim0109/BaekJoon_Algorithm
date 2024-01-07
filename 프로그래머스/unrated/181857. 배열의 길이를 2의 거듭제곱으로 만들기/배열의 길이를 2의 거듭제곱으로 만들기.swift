import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var n = arr.count
    var target = 1
    
    while target < n {
        target *= 2
    }
    
    var answer = Array(repeating: 0, count: target)
    answer[0..<n] = arr[0..<n]
    return answer
}