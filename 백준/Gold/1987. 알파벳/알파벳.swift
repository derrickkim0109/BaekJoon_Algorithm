let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]

var board = Array(repeating: [Int](), count: r)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var result = 0

for i in 0..<r {
    let line = readLine()!.map { Int(String($0.asciiValue!))! - 65 }
    board[i] = line
}

func dfs(_ x: Int, _ y: Int, _ count: Int, _ bit: Int) {
    result = max(result, count)

    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        guard nextX >= 0,
              nextX < r,
              nextY >= 0,
              nextY < c else {
            continue
        }

        let nextBit = 1 << board[nextX][nextY]
        
        if bit & nextBit == 0 {
            dfs(nextX, nextY, count + 1, bit | nextBit)
        }
    }
}

dfs(0, 0, 1, 1 << board[0][0])

print(result)
