import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var answer = arr
    
    for query in queries {
        let i = query[0]
        let j = query[1]
        answer.swapAt(i, j)
    }
    
    return answer
}