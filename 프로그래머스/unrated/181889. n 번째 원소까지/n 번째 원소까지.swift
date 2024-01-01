import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    let index = n - 1
    return num_list[...index].map { $0 }
}