let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 행의 개수
let M = input[1] // 열의 개수
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var graphs = Array(repeating: Array(repeating: 0, count: M), count: N)
// 방문 여부를 추적하는 배열 초기화
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var distance = Array(repeating: Array(repeating: 0, count: M), count: N)

// 미로 정보 입력 받기
for i in 0..<N {
    let v = readLine()!.map { Int(String($0))! }
    graphs[i] = v
}

func bfs() {
    distance[0][0] = 1
    visited[0][0] = true

    var queue: [[Int]] = [[0,0]]

    while !queue.isEmpty {
        let current = queue.removeFirst()

        let x = current[0]
        let y = current[1]

        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            guard nextX >= 0,
               nextX < N,
               nextY >= 0,
               nextY < M else {
                continue
            }

            if !visited[nextX][nextY],
               graphs[nextX][nextY] == 1 {
                distance[nextX][nextY] = distance[x][y] + 1
                visited[nextX][nextY] = true
                queue.append([nextX, nextY])
            }
        }
    }
}

bfs()
print(distance[N - 1][M-1])