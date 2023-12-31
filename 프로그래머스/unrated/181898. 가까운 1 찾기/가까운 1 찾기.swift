import Foundation

func solution(_ arr:[Int], _ idx:Int) -> Int {
    if idx == arr.count {
        return -1
    }
    
    for i in idx+1...arr.count {
        if arr[i - 1] == 1 {
            return i - 1
        }
    }
    
    return -1
}