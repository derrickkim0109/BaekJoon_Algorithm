import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    var answer = [Int]()
    
    for i in 0..<num_list.count {
        if i % n == 0 {
            answer.append(num_list[i])
        }
    }
    
    return answer
}