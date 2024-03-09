enum Person {
    case normal // 적록색약이 아닌 사람
    case nonNormal // 적록색약인 사람
}

let n = Int(readLine()!)! // 배열의 크기

var graph = Array(repeating: Array(repeating: "", count: n), count: n) // 색깔 정보를 저장할 2차원 배열
var normalVisited = Array(repeating: Array(repeating: false, count: n), count: n) // 적록색약이 아닌 사람이 방문한 정보
var nonNormalVisited = Array(repeating: Array(repeating: false, count: n), count: n) // 적록색약인 사람이 방문한 정보

let dx = [-1, 1, 0, 0] // x축 이동 (상, 하)
let dy = [0, 0, -1, 1] // y축 이동 (좌, 우)

var normalCount = 0 // 적록색약이 아닌 사람이 볼 수 있는 구역의 수
var nonNormalCount = 0 // 적록색약인 사람이 볼 수 있는 구역의 수

// 그래프 입력 받기
for i in 0..<n {
    let colors = readLine()!.map { String($0) }
    graph[i] = colors
}

func dfs(_ x: Int, _ y: Int, _ type: Person) {
    let current = graph[x][y]

    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        guard nextX >= 0,
              nextX < n,
              nextY >= 0,
              nextY < n else {
            continue
        }

        let nextNode = graph[nextX][nextY]

        switch type {
        case .normal:
            // R과 G를 같은 색으로 간주하는 경우 (적록색약인 사람)
            guard !normalVisited[nextX][nextY],
                    current == nextNode ||
                    ((current == "R" || current == "G")
                     && (nextNode == "R" || nextNode == "G")) else {
                continue
            }
            normalVisited[x][y] = true
            dfs(nextX, nextY, .normal)
        case .nonNormal:
            // 같은 색인 경우에만 이동 (적록색약인 사람의 시각에서는 R과 G도 같은 색으로 처리)
            guard !nonNormalVisited[nextX][nextY],
                  current == nextNode else {
                continue
            }
            nonNormalVisited[x][y] = true
            dfs(nextX, nextY, .nonNormal)
        }
    }
}

func bfs(_ startX: Int, _ startY: Int, _ type: Person) {
    var queue: [(Int, Int)] = [(startX, startY)]

    // 시작 지점 방문 처리
    switch type {
    case .normal:
        normalVisited[startX][startY] = true
    case .nonNormal:
        nonNormalVisited[startX][startY] = true
    }

    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        let current = graph[x][y]

        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]

            guard nextX >= 0,
                  nextX < n,
                  nextY >= 0,
                  nextY < n else {
                continue
            }

            let nextNode = graph[nextX][nextY]

            switch type {
            case .normal:
                guard !normalVisited[nextX][nextY],
                        current == nextNode ||
                        ((current == "R" || current == "G")
                         && (nextNode == "R" || nextNode == "G")) else {
                    continue
                }

                normalVisited[nextX][nextY] = true
                queue.append((nextX, nextY))

            case .nonNormal:
                guard !nonNormalVisited[nextX][nextY],
                      current == nextNode else {
                    continue
                }

                nonNormalVisited[nextX][nextY] = true
                queue.append((nextX, nextY))
            }
        }
    }
}


// 모든 위치에 대해 DFS 실행
for x in 0..<n {
    for y in 0..<n {
        // 적록색약인 사람이 아직 방문하지 않은 경우
        if !nonNormalVisited[x][y] {
            nonNormalCount += 1
            //            dfs(x, y, .nonNormal)
            bfs(x, y, .nonNormal)
        }

        // 적록색약이 아닌 사람이 아직 방문하지 않은 경우
        if !normalVisited[x][y] {
            normalCount += 1
            //            dfs(x, y, .normal)
            bfs(x, y, .normal)
        }
    }
}

// 결과 출력 (적록색약인 사람이 볼 수 있는 구역의 수, 적록색약이 아닌 사람이 볼 수 있는 구역의 수)
print("\(nonNormalCount) \(normalCount)")
