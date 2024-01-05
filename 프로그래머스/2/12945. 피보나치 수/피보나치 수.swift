func solution(_ n: Int) -> Int {
    var answer: [Int] = [0, 1]

    if n == 0 {
        return 0
    } else if n == 1 || n == 2 {
        return 1
    } else {
         for i in 2...n {
           answer.append((answer[i-2] + answer[i-1]) % 1234567)
         }
    }

    return answer[n]
}