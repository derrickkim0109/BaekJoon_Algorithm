import Foundation

func solution(_ num_list:[Int], _ n:Int) -> Int {
    if num_list.isEmpty {
        return 0
    }
    return num_list.contains(n) ? 1 : 0
}