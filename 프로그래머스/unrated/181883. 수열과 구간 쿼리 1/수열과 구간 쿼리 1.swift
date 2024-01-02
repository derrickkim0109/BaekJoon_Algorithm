import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var answer = arr
    
    for query in queries {
        let s = query[0]
        let e = query[1]
        
        for i in s...e {
            answer[i] += 1
        }
    }
    
    return answer
}