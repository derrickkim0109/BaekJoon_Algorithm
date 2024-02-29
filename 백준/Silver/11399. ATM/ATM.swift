let totalCount = Int(readLine()!)!
var requiredTime = readLine()!.split(separator: " ").map { Int($0)! }
var dic = [Int: Int]()

for index in 0..<totalCount {
    dic.updateValue(requiredTime[index], forKey: index + 1)
}

let values = dic.sorted(by: { $0.value < $1.value }).map { $0.value }
var previous = 0
var answer = [Int]()

for v in values {
    previous = previous + v
    answer.append(previous)
}

print(answer.reduce(0, +))