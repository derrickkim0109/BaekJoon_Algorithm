import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    for num in left...right {
        let number = calculate(num)
        if number % 2 == 0 {
            answer += num
        } else if number % 2 == 1 {
            answer -= num
        }
    }
    
    return answer
}

func calculate(_ num: Int) -> Int {
    var count = 0
    
    for i in 1...num {
        if num % i == 0 {
            count += 1
        }
    }
    return count
}