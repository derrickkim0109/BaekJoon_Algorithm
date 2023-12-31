import Foundation

func solution(_ start:Int, _ end_num:Int) -> [Int] {
    var answer = [Int]()
    
    for num in stride(from: start, to: end_num - 1, by: -1) {
        answer.append(num)
    }
    
    return answer
}