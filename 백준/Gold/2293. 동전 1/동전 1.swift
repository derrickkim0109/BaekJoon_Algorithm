import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]
var dp = Array(repeating: 0, count: 10001)
var coin = [Int]()

dp[0] = 1

for i in 0..<n {
    coin.append(Int(readLine()!)!)
    for j in stride(from: coin[i], through: k, by: 1){
        if dp[j] + dp[j - coin[i]] >= Int(pow(2.0, 31.0)) {
            dp[j] = 0
        } else {
            dp[j] += dp[j - coin[i]]
        }
    }
}

print(dp[k])