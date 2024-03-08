let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: n + 1)

for i in 0..<n {
    dp[i + 1] = 1

    for j in 0..<i+1 {
        if array[i] > array[j] {
            dp[i + 1] = max(dp[i + 1], dp[j + 1] + 1)
        }
    }
}

print(dp.max()!)
