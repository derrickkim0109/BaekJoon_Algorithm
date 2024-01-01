import Foundation

func solution(_ arr:[Int]) -> [Int] { 
    var answer = arr
    var minValue = 100000
    var maxValue = 0
    
    for i in 0..<arr.count {
        if (arr[i] == 2) {
            minValue = min(minValue, i);
            maxValue = max(maxValue, i);
        }
    }
    
    if (minValue <= maxValue) {
        return answer[minValue...maxValue].map { $0 }
    } else {
        return [-1]
    }
}