let n = Int(readLine()!)!
var myMax = readLine()!.split(separator: " ").map { Int($0)! }
var myMin = myMax

for _ in 1..<n {
    let v = readLine()!.split(separator: " ").map { Int($0)! }

    let maxValue = myMax
    let minValue = myMin

    myMax[0] = v[0] + max(maxValue[0], maxValue[1])
    myMax[1] = v[1] + max(maxValue[0], max(maxValue[1], maxValue[2]))
    myMax[2] = v[2] + max(maxValue[1], maxValue[2])

    myMin[0] = v[0] + min(minValue[0], minValue[1])
    myMin[1] = v[1] + min(minValue[0], min(minValue[1], minValue[2]))
    myMin[2] = v[2] + min(minValue[1], minValue[2])
}

print(myMax.max()!, myMin.min()!)
