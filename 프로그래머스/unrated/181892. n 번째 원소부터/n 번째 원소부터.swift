import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    let index = n - 1
    return n != num_list.count ? num_list[index...].map { $0 } : [num_list[index]]
}