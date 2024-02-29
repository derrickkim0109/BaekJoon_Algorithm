let n = Int(readLine()!)!
var answer = 0
var cost = 0
var array = Array(repeating: 0, count: 100000)
var buf = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 0..<buf.count {
    array[i] = buf[i]
}

for i in 0..<n {
    if array[i + 1] > array[i + 2] {
        let cost = min(array[i], array[i + 1] - array[i + 2])
        answer += 5 * cost
        array[i] -= cost
        array[i + 1] -= cost

        let cost2 = min(array[i], min(array[i + 1], array[i + 2]))
        answer += 7 * cost2
        array[i] -= cost2
        array[i + 1] -= cost2
        array[i + 2] -= cost2

    } else {
        let cost2 = min(array[i], min(array[i + 1], array[i + 2]))
        answer += 7 * cost2
        array[i] -= cost2
        array[i + 1] -= cost2
        array[i + 2] -= cost2

        let cost = min(array[i], array[i + 1])
        answer += 5 * cost
        array[i] -= cost
        array[i + 1] -= cost
    }

    answer += 3 * array[i]
}

print(answer)