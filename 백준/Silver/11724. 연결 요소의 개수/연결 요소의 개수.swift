// 입력을 받아 변수에 저장
let input = readLine()!.split(separator: " ").map { Int($0)! }
let nodesCount = input[0] // 정점의 개수
let edgesCount = input[1] // 간선의 개수
var graph: [[Int]] = Array(repeating: [Int](), count: nodesCount + 1) // 인접 리스트
var visited: [Bool] = Array(repeating: false, count: nodesCount + 1) // 방문 여부 체크
var answer = 0 // 연결 요소의 개수

// 간선 정보를 입력받아 양방향 그래프로 인접 리스트를 구성
for _ in 0..<edgesCount {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    graph[u].append(v)
    graph[v].append(u)
}

// 너비 우선 탐색(BFS) 함수
func bfs(_ startNode: Int) {
    var queue = [startNode]
    var index = 0
    visited[startNode] = true

    while queue.count > index {
        let currentNode = queue[index]

        for neighbor in graph[currentNode] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append(neighbor)
            }
        }

        index += 1
    }
}

// 깊이 우선 탐색(DFS) 함수
func dfs(_ currentNode: Int) {
    visited[currentNode] = true

    for neighbor in graph[currentNode] {
        if !visited[neighbor] {
            dfs(neighbor)
        }
    }
}

// 모든 노드를 순회하며 방문하지 않은 노드가 있으면 새로운 연결 요소 발견
for i in 1...nodesCount {
    if !visited[i] {
        answer += 1
        bfs(i) // BFS를 사용하여 연결 요소 탐색
        // dfs(i) // 또는 DFS를 사용하여 연결 요소 탐색
    }
}

print(answer)