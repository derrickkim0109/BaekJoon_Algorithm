import Foundation

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    var answer = [Int]()
    
    for i in 0..<arr.count {
        if answer.count == k {
            return answer
        }
        
        if !answer.contains(arr[i]) {
            answer.append(arr[i])
        }
    }
    
    while answer.count < k {
        answer.append(-1)
    }
    
    return answer
}