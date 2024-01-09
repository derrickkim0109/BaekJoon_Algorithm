import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    let maxValue = max(arr.count, arr[0].count)
    var answer = Array(repeating: Array(repeating: 0, count: maxValue), count: maxValue)

    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            answer[i][j] = arr[i][j]
        }
    }
    
    return answer
}