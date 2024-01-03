import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var answer = [Int]()
    
    for num in arr {
        if num >= 50 && num % 2 == 0 {
            answer.append(num / 2)
        } else if num < 50 && num % 2 != 0 {
            answer.append(num * 2)
        } else {
            answer.append(num)
        }
    }
    
    return answer
}