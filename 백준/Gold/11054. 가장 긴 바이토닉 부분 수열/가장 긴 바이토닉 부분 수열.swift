let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var increaseDP = Array(repeating: 1, count: n)
var decreaseDP = Array(repeating: 1, count: n)

// LIS 계산
for i in 0..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            increaseDP[i] = max(increaseDP[i], increaseDP[j] + 1)
        }
    }
}

// LDS 계산 (배열을 뒤집어서 동일한 방식으로 계산)
for i in stride(from: n - 1, through: 0, by: -1) {
    for j in stride(from: n - 1, through: i, by: -1) {
        if arr[i] > arr[j] {
            decreaseDP[i] = max(decreaseDP[i], decreaseDP[j] + 1)
        }
    }
}

// 최대 바이토닉 수열 길이 계산
let maxLength = (0..<n).map { increaseDP[$0] + decreaseDP[$0] - 1 }.max()!
print(maxLength)
