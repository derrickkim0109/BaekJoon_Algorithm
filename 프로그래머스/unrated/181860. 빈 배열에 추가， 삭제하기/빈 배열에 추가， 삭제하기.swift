import Foundation

func solution(_ arr:[Int], _ flag:[Bool]) -> [Int] {
    var answer = [Int]()
    
    for (i, f) in flag.enumerated() {
        if f == true {
            for _ in 0..<arr[i]*2 {
                answer.append(arr[i])
            }
        } else {
            for _ in 0..<arr[i] {
                answer.removeLast()
            }
        }
    }
    return answer
}