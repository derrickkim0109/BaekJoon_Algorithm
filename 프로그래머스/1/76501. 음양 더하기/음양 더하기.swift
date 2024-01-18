import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    
    for (index, num) in absolutes.enumerated() {
        let number = signs[index] == true ? num : -num
        answer += number
    }
    
    print(answer)
    
    return answer
}