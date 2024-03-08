let n = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited: [[Bool]] = []

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var target = 0
var answer = 0

for x in 0..<n {
    let v = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[x] = v

    for y in 0..<n {
        target = max(target, graph[x][y])
    }
}


func bfs(_ startX: Int, _ startY: Int, _ target: Int) {
    var queue: [(Int, Int)] = [(startX, startY)]
    visited[startX][startY] = true

    while !queue.isEmpty {
        let (x, y) = queue.removeLast()

        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            guard nextX >= 0,
                nextX < n,
               nextY >= 0,
               nextY < n else {
                continue
            }

            if !visited[nextX][nextY], graph[nextX][nextY] > target {
                visited[nextX][nextY] = true
                queue.append((nextX, nextY))
            }
        }
    }
}

for t in 0..<target {
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var count = 0

    for x in 0..<n {
        for y in 0..<n {
            if !visited[x][y], graph[x][y] > t {
                bfs(x, y, t)
                count += 1
            }
        }
    }

    answer = max(answer, count)
}

print(answer)
