import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
    var answer = -1
    var dp: [Set<Int>] = []

    for i in 1..<9 {
        var allCase = Set<Int>()
        let checkNumber = Int(String(repeating: "\(N)", count: i))!
        
        allCase.insert(checkNumber)

        for j in 0..<i-1 {
            for op1 in dp[j] {
                for op2 in dp[i-j-2] {
                    allCase.insert(op1 - op2)
                    allCase.insert(op1 + op2)
                    allCase.insert(op1 * op2)
                    if op2 != 0 {
                        allCase.insert(op1 / op2)
                    }
                }
            }
        }

        if allCase.contains(number) {
            answer = i
            break
        }

        dp.append(allCase)
    }

    return answer
}
