import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var answer = num_list.sorted()
    
    return Array(answer[0...4])
}