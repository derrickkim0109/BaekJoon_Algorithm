let n = Int(readLine()!)!
// 그래프 초기화: n x n 크기의 2차원 배열
var graphs: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
// 방문 여부를 추적하는 2차원 배열
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
// 상하좌우 이동을 위한 방향 벡터
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
// 구역 내 요소의 개수를 세는 변수
var count = 0

// 그래프 입력 받기
for i in 0..<n {
    let v = readLine()!.map { Int(String($0))! }
    graphs[i] = v
}

// DFS 함수 정의
func dfs(_ x: Int,_ y: Int) {
    count += 1 // 현재 구역의 요소 개수 증가
    visited[x][y] = true // 현재 노드 방문 처리

    // 상하좌우 탐색
    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        // 다음 위치가 그래프 범위 내에 있고 아직 방문하지 않았다면 탐색 진행
        guard nextX >= 0,
              nextX < n,
              nextY >= 0,
              nextY < n else {
            continue
        }

        if !visited[nextX][nextY],
            graphs[nextX][nextY] == 1 {

            // 재귀적으로 다음 노드 탐색
            dfs(nextX, nextY)
        }
    }
}

// 결과를 저장할 배열
var result: [Int] = []

// 모든 노드에 대해 DFS 탐색 시도
for i in 0..<n {
    for j in 0..<n {
        // 현재 노드가 방문하지 않은 구역의 시작점이면 탐색 시작
        if !visited[i][j] && graphs[i][j] == 1 {
            count = 0 // 구역 내 요소 개수 초기화
            dfs(i, j) // DFS 탐색 시작
            result.append(count) // 탐색 완료 후 결과 배열에 추가
        }
    }
}

// 출력: 구역의 개수와 각 구역 내 요소의 개수
print(result.count) // 구역의 총 개수 출력
result.sort() // 구역 내 요소의 개수를 오름차순으로 정렬
print(result.map{String($0)}.joined(separator: "\n"))