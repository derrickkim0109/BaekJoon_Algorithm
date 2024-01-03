import Foundation

func solution(_ num_list:[Int]) -> Int {
    let sum = num_list.map { $0 }.reduce(0, +)
    let multiple = num_list.map { $0 }.reduce(1, *)
    return num_list.count >= 11 ? sum : multiple
}