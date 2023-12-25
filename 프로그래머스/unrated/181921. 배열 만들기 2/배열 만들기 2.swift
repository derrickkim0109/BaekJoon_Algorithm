import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    var answer = [Int]()

    for num in l...r {
        let numberString = String(num).map { String($0) }

        if(num % 5 != 0) {
            continue
        }

        let otherNumbers = (1...9).map { $0 }.filter { $0 != 5 }.map { String($0) }
        var count = 0

        for char in numberString {
            if char == "0" || char == "5" {
                if !otherNumbers.contains(char) {
                    count += 1
                }
            }
        }

        if count == numberString.count {
            answer.append(num)
        }
    }

    if answer.isEmpty {
        answer.append(-1)
    }

    return answer
}