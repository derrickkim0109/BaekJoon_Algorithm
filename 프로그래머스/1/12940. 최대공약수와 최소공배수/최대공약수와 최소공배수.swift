func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), n * m / gcd(n, m)]
}