let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 수빈이 위치
let k = input[1] // 동생 위치
var visited = Array(repeating: false, count: 100_001)

func bfs() {
    var queue = [[n, 0]]
    visited[n] = true
    var index = 0

    while index <= queue.count {
        let currentPoint = queue[index]
        let x = currentPoint[0]
        let y = currentPoint[1]

        if x == k {
            print(y)
            return
        }

        // -1, 1, *2
        for i in 0..<3 {
            var nextX = 0

            switch i {
            case 0:
                nextX = x - 1
            case 1:
                nextX = x + 1
            default:
                nextX = x * 2
            }

            if nextX >= 0,
               nextX <= 100_000,
               !visited[nextX] {
                visited[nextX] = true
                queue.append([nextX, y + 1])
            }
        }

        index += 1
    }
}
bfs()