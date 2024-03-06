// 테스트 케이스의 수를 입력받습니다.
let t = Int(readLine()!)!

for _ in 0..<t {
    // 배추밭의 가로 길이 m, 세로 길이 n, 배추 위치 개수 k를 입력받습니다.
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0] // 가로
    let n = mnk[1] // 세로
    let k = mnk[2] // 배추 위치 개수

    // 상하좌우 이동을 위한 방향 배열입니다.
    let dx = [0, 0, 1, -1] // 좌우
    let dy = [1, -1, 0, 0] // 상하

    // 배추밭을 나타내는 2차원 배열을 초기화합니다.
    var graphs: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    // 방문한 위치를 기록하는 2차원 배열을 초기화합니다.
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)

    // 배추 위치 개수만큼 반복하여 배추 위치를 graphs 배열에 표시합니다.
    for _ in 0..<k {
        let distance = readLine()!.split(separator: " ").map { Int($0)! }
        graphs[distance[1]][distance[0]] = 1
    }

    // DFS(깊이 우선 탐색) 함수 정의
    func dfs(_ y: Int,_ x: Int) {
        visited[y][x] = true // 현재 위치 방문 처리

        // 상하좌우 네 방향에 대해 탐색
        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            // 탐색할 다음 위치가 배추밭 범위 내에 있고 아직 방문하지 않은 배추 위치인 경우
            if nextX >= 0, nextX < m, nextY >= 0, nextY < n, !visited[nextY][nextX], graphs[nextY][nextX] == 1 {
                dfs(nextY, nextX) // 재귀적으로 다음 위치 탐색
            }
        }
    }

    var count = 0 // 인접한 배추 그룹의 수를 세는 변수

    // 배추밭 전체를 순회
    for y in 0..<n {
        for x in 0..<m {
            // 방문하지 않은 배추 위치에서 탐색을 시작하여 그룹을 찾음
            if !visited[y][x] && graphs[y][x] == 1 {
                dfs(y, x) // DFS로 해당 그룹 탐색
                count += 1 // 그룹 하나를 찾을 때마다 카운트 증가
            }
        }
    }
    // 필요한 배추흰지렁이의 최소 수(배추 그룹의 수)를 출력
    print(count)
}