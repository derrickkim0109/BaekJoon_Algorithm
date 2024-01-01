import Foundation

func solution(_ arr:[Int], _ intervals:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    for interval in intervals {
        let a = interval[0]
        let b = interval[1]
        
        answer.append(contentsOf: arr[a...b])
    }
    
    return answer
}