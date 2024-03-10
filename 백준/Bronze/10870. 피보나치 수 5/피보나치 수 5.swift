let n = Int(readLine()!)!

func dp(_ n: Int) -> Int {
    if n < 2 {
        return n
    }

    return dp(n - 1) + dp(n - 2)
}

print(dp(n))

