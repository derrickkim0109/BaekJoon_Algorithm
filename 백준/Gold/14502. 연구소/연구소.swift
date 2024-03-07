
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 연구소의 세로 길이
let m = input[1] // 연구소의 가로 길이

// 연구소 지도 초기화
var map = Array(repeating: Array(repeating: 0, count: m), count: n)

// 이동 방향 (상하좌우)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// 최대 안전 영역 크기
var answer = 0

// 연구소 지도 입력 받기
for i in 0..<n {
    let value = readLine()!.split(separator: " ").map { Int($0)! }
    map[i] = value
}

// DFS로 벽 세우기
func dfs(_ wallCount: Int) {
    // 벽을 3개 세웠다면 바이러스 퍼트리기 시작
    if wallCount == 3 {
        bfs()
        return
    }

    // 모든 빈 칸에 대해 벽을 세우고 다음 dfs 호출
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 0 {
                map[i][j] = 1 // 벽 세우기
                dfs(wallCount + 1) // 다음 벽 세우기
                map[i][j] = 0 // 원상 복구
            }
        }
    }
}

// BFS로 바이러스 퍼트리기
func bfs() {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var tempMap = map // 바이러스 퍼짐 시뮬레이션을 위한 임시 지도
    var queue = [[Int]]()

    // 바이러스 위치 찾아서 큐에 추가
    for i in 0..<n {
        for j in 0..<m {
            if tempMap[i][j] == 2 {
                queue.append([i, j])
            }
        }
    }

    // BFS 실행
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let x = current[0]
        let y = current[1]

        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            // 맵 범위 내이고, 방문하지 않았으며, 빈 칸일 경우
            guard nextX >= 0,
                nextX < n,
               nextY >= 0,
               nextY < m else {
                continue
            }

            if !visited[nextX][nextY], tempMap[nextX][nextY] == 0 {
                visited[nextX][nextY] = true
                tempMap[nextX][nextY] = 2 // 바이러스 퍼짐
                queue.append([nextX, nextY])
            }
        }
    }

    // 안전 영역 크기 계산
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if tempMap[i][j] == 0 {
                count += 1
            }
        }
    }

    // 최대 안전 영역 크기 업데이트
    answer = max(answer, count)
}

dfs(0) // 벽 세우기 시작

print(answer)
