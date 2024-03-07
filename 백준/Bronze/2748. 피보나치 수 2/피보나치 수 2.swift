let n = Int(readLine()!)!
var cache = Array(repeating: -1, count: n + 1)
cache[0] = 0
cache[1] = 1

func fibo(_ n: Int) -> Int {
    if cache[n] < 0 {
        cache[n] = fibo(n - 2) + fibo(n - 1)
    }
    
    return cache[n]
}

print(fibo(n))