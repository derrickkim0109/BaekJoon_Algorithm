import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    let preIndex = n - 1
    let previous = num_list[...preIndex].map{ $0 }
    let target = num_list[n...].map { $0 }
    let answer = target + previous
    
    return answer
}