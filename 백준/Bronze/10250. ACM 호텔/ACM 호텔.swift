import Foundation 

let input = Int(readLine()!)!
var x = 0
var y = 0
var result = [String]()

for _ in 0..<input {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let H = info[0]
    let N = info[2]

    x = N / H + 1
    y = N % H

    if (y == 0) {
        y = H
        x -= 1
    }

    let formattedString = String(format: "%d%02d", y, x)
    result.append(formattedString)
}

for r in result {
    print(r)
}
