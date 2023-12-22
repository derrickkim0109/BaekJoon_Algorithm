import Foundation

// a = 3
// d = 7

// d = a_2 - a_1 == 7
// a_2 = 10 
// a_3 = 14
// 3 10 17 24 ....

func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    var answer = 0
    
    var arithmeticSequence: [Int] = []
    var currentNumber = a
    
    for _ in 0..<included.count {
        arithmeticSequence.append(currentNumber)
        currentNumber += d
    }
    
    for (index, value) in included.enumerated() {
        if value == true {
            answer += arithmeticSequence[index]
        }
    }
    
    return answer
}