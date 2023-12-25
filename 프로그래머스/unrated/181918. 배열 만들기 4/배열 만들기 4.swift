import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var stk = [Int]()
    var i = 0
    
    while i < arr.count {
        if stk.isEmpty {
            stk.append(arr[i])
            i += 1
        } else if !stk.isEmpty && stk.last! < arr[i] {
            stk.append(arr[i])
            i += 1
        } else if !stk.isEmpty && stk.last! >= arr[i] {
            stk.removeLast()
        }
    }
    
    return stk
}