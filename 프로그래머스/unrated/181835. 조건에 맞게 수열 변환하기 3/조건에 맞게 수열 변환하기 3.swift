import Foundation

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    let sum = arr.map { $0 + k }
    let multiple = arr.map { $0 * k }
    
    if k % 2 == 0 {
        return sum
    } else {
        return multiple
    }
}