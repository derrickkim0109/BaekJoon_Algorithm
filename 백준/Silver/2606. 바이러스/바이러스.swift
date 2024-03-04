let n = Int(readLine()!)! // 컴퓨터의 수
let m = Int(readLine()!)! // 네트워크 상에서 직접 연결된 컴퓨터 쌍의 수

var graph = Array(repeating: [Int](), count: n + 1) // 그래프 초기화
var visited = [Bool](repeating: false, count: n + 1) // 방문 여부 체크 배열

// 그래프 구성
for _ in 0..<m {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    graph[connection[0]].append(connection[1])
    graph[connection[1]].append(connection[0])
}

var infectedCount = 0

func dfs(_ node: Int) {
    visited[node] = true
    infectedCount += 1
    
    for next in graph[node] {
        if !visited[next] {
            dfs(next)
        }
    }
}

dfs(1)

print(infectedCount - 1)