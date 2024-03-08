// n: 그래프의 크기 (nxn)
let n = Int(readLine()!)!

// graph: 각 위치의 높이를 저장하는 2차원 배열
var graph = Array(repeating: Array(repeating: 0, count: n), count: n)

// visited: 각 위치를 방문했는지 여부를 저장하는 2차원 배열
var visited: [[Bool]] = []

// 이동 방향을 정의 (상, 하, 좌, 우)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// target: 그래프 내 최대 높이
var target = 0

// answer: 조건을 만족하는 구역의 최대 개수
var answer = 0

// 그래프의 높이 정보 입력 및 최대 높이 계산
for x in 0..<n {
    let v = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[x] = v

    for y in 0..<n {
        target = max(target, graph[x][y])
    }
}

// BFS 함수: 주어진 위치에서 시작하여 조건을 만족하는 모든 위치를 방문
func bfs(_ x: Int, _ y: Int, _ target: Int) {
    var queue: [(Int, Int)] = [(x, y)]
    visited[x][y] = true

    while !queue.isEmpty {
        let (x, y) = queue.removeLast()

        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            if nextX >= 0, nextX < n, nextY >= 0, nextY < n, !visited[nextX][nextY], graph[nextX][nextY] > target {
                visited[nextX][nextY] = true
                queue.append((nextX, nextY))
            }
        }
    }
}

// DFS 함수: 주어진 위치에서 시작하여 조건을 만족하는 모든 위치를 방문 (재귀적 방법)
func dfs(_ x: Int, _ y: Int, _ target: Int) {
    visited[x][y] = true

    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        if nextX >= 0, nextX < n, nextY >= 0, nextY < n, !visited[nextX][nextY], graph[nextX][nextY] > target {
            dfs(nextX, nextY, target)
        }
    }
}

// 각 가능한 높이에 대해 조건을 만족하는 구역의 수를 계산
for t in 0..<target {
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var count = 0

    for x in 0..<n {
        for y in 0..<n {
            if !visited[x][y], graph[x][y] > t {
//                bfs(x, y, t) // BFS 또는 DFS로 구역 탐색
                dfs(x, y, t) // 주석 처리된 DFS 호출
                count += 1
            }
        }
    }

    answer = max(answer, count) // 최대 구역 수 업데이트
}

print(answer)
