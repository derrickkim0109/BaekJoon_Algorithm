// 입력 받기: n은 집의 개수
let n = Int(readLine()!)!
// dp 배열 초기화: 각 집에 대해 R, G, B로 칠할 때의 최소 비용을 저장
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
// 각 집의 칠하는 비용을 저장하는 배열
var array = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
// 가능한 최대 비용 설정
var max = 1000 * 1000 + 1
// 최종 결과를 저장할 변수
var result = max

// 각 집의 색칠 비용 입력 받기
for i in 1...n {
    let colorPrice = readLine()!.split(separator: " ").map { Int(String($0))! }
    array[i] = colorPrice
}

// 첫 번째 집의 색을 기준으로 설정하고 나머지 집들의 최소 비용 계산
for k in 0..<3 {
    let a = (k + 1) % 3
    let b = (k + 2) % 3

    // 첫 번째 집의 색을 k로 고정하고, 나머지 두 색의 비용을 최대로 설정하여 첫 번째 집의 색이 고정되었음을 나타냄
    dp[1][k] = array[1][k]
    dp[1][a] = max
    dp[1][b] = max

    // 2번째 집부터 마지막 집까지 최소 비용 계산
    for i in 2...n {
        dp[i][0] = array[i][0] + min(dp[i - 1][1], dp[i - 1][2])
        dp[i][1] = array[i][1] + min(dp[i - 1][0], dp[i - 1][2])
        dp[i][2] = array[i][2] + min(dp[i - 1][0], dp[i - 1][1])
    }

    // 첫 번째 집을 k로 칠했을 때, 마지막 집을 a, b 색으로 칠하는 경우 중 최소 비용을 결과에 반영
    result = min(result, dp[n][a], dp[n][b])
}

print(result)
