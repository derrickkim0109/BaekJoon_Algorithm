import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var answer = num_list.sorted()
    
    while answer.count != num_list.count - 5 {
        answer.removeFirst()
    }
    
    return answer
}