import Foundation

func solution(_ n:Int) -> [Int] {
    var number = n
    var answer = [Int]()
    
    for i in stride(from: 2, to: n+1, by: 1) {
        while number % i == 0 {
            number /= i
            answer.append(i)
        }
    }
    
    return Array(Set(answer)).sorted()
}