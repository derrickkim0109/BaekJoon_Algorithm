func solution(_ n:Int64) -> Int64 {
    let number = n / 10
    let count = String(number).count
    let max = count == 1 ? n : number

    for i in 1...max {
        let target = i * i

        if target == n {
            let num = i + 1
            return num * num
        }
    }

    return -1
}