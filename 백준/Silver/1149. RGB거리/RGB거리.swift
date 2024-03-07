let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1) // n 집에 대해 각각 R, G, B 비용을 저장할 DP 배열

for i in 0..<n {
    let colorPrice = readLine()!.split(separator: " ").map { Int(String($0))! }
    dp[i + 1][0] = colorPrice[0] // Red
    dp[i + 1][1] = colorPrice[1] // Green
    dp[i + 1][2] = colorPrice[2] // Blue
}

for i in 2...n {
    // 각 색깔을 선택했을 때의 최소 비용 계산
    dp[i][0] += min(dp[i - 1][1], dp[i - 1][2]) // Red를 선택했을 때, 이전 집은 Green 또는 Blue
    dp[i][1] += min(dp[i - 1][0], dp[i - 1][2]) // Green을 선택했을 때, 이전 집은 Red 또는 Blue
    dp[i][2] += min(dp[i - 1][0], dp[i - 1][1]) // Blue를 선택했을 때, 이전 집은 Red 또는 Green
}

// 마지막 집에 대해 각 색깔별 최소 비용 중 가장 작은 값이 전체 최소 비용
print(min(dp[n][0], dp[n][1], dp[n][2]))
