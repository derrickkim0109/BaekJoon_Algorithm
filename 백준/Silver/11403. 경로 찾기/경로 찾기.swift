let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let v = readLine()!.split(separator: " ").map { Int($0)! }
    graph[i] = v
}

func dfs(start: Int, now: Int) {
    for i in 0..<n {
        if graph[now][i] == 1 && !visited[start][i] { // start에서 시작한 탐색으로, i를 방문하지 않았다면
            result[start][i] = 1
            visited[start][i] = true // start에서 i로의 경로를 방문했음을 표시
            dfs(start: start, now: i) // i에서 다시 DFS 수행
        }
    }
}

// 각 시작점에 대한 DFS 탐색을 위한 반복문
for i in 0..<n {
    dfs(start: i, now: i)
    visited = Array(repeating: Array(repeating: false, count: n), count: n) // 각 시작점마다 visited 초기화
}

for r in result {
    for i in r {
        print(i, terminator: " ")
    }
    print("")
}