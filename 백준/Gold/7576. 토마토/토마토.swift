// 1 익은 토마토, 0 익지 않은 토마토
// -1 토마토가 들어있지 않음
// 토마토 박스의 가로와 세로 크기를 입력받음
let mn = readLine()!.split(separator: " ").map { Int($0)! }
let m = mn[0] // 가로 x
let n = mn[1] // 세로 y

// 상하좌우 이동을 위한 방향 설정
let dx = [1, -1, 0, 0]
let dy = [0, 0, -1, 1]

// 그래프 초기화 및 입력받기
var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
var blankCount = 0 // 토마토가 들어있지 않은 칸의 수
var result = 0 // 최종 결과(모든 토마토가 익는데 걸리는 시간)
var tomatoCount = 0 // 익은 토마토의 수

// 그래프 데이터 입력 받기 및 빈 칸(-1) 세기
for i in 0..<n {
    let v = readLine()!.split(separator: " ").map { Int($0)! }
    graph[i] = v
    blankCount += v.filter { $0 == -1 }.count
}

var queue: [[Int]] = [] // BFS를 위한 큐

// 익은 토마토 위치 찾아 큐에 추가
for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 1 {
            queue.append([i, j, 0]) // 위치 i, j와 날짜 0을 큐에 추가
            tomatoCount += 1
        }
    }
}

// BFS 실행
func bfs() {
    var index = 0

    while queue.count > index {
        let current = queue[index]
        let x = current[0]
        let y = current[1]

        // 상하좌우 탐색
        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            let nextDay = current[2] + 1 // 다음 날

            // 범위 확인 후 익지 않은 토마토를 익히고 큐에 추가
            if nextX >= 0, nextX < n, nextY >= 0, nextY < m, graph[nextX][nextY] == 0 {
                graph[nextX][nextY] = 1
                queue.append([nextX, nextY, nextDay])
                tomatoCount += 1
                result = nextDay // 마지막으로 토마토가 익은 날짜를 결과로 저장
            }
        }

        index += 1
    }
}

// BFS 실행
bfs()

// 모든 토마토가 익었다면 결과 출력, 그렇지 않으면 -1 출력
if tomatoCount == (m * n) - blankCount {
    print(result)
} else {
    print(-1)
}
