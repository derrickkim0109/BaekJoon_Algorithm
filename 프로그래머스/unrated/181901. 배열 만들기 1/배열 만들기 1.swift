import Foundation

func solution(_ n:Int, _ k:Int) -> [Int] {
    var answer = [Int]()
    
    for num in 1...n {
        if num % k == 0 {
            answer.append(num)
        }
    }
    
    return answer
}