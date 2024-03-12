let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: 1001), count: 1001)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var index = 0
var result = -1

for i in 0..<n {
    let array = readLine()!.map { Int(String($0))! }

    graph[i] = array
}

func bfs() {
    var queue: [((x: Int, y: Int, depth: Int), brokenWall: Int)] = [((0,0,1), 1)]
    visited[0][0][1] = true

    while queue.count > index {
        let current = queue[index]

        let x = current.0.x
        let y = current.0.y
        let depth = current.0.depth
        let brokenWall = current.brokenWall
        
        if x == n - 1 && y == m - 1 {
            result = depth
            break
        }

        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            guard nextX >= 0,
                  nextX < n,
                  nextY >= 0,
                  nextY < m else {
                continue
            }

            guard !visited[nextX][nextY][brokenWall] else {
                continue
            }

            if graph[nextX][nextY] == 1 && brokenWall == 1 {
                visited[nextX][nextY][brokenWall - 1] = true
                queue.append(((nextX, nextY, depth + 1), brokenWall - 1))
            } else if graph[nextX][nextY] == 0 {
                visited[nextX][nextY][brokenWall] = true
                queue.append(((nextX, nextY, depth + 1), brokenWall))
            }
        }
        index += 1
    }
}

bfs()
print(result)