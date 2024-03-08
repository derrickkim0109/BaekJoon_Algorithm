let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n + 1)
var parents = Array(repeating: -1, count: n + 1)

for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let v1 = input[0]
    let v2 = input[1]

    graph[v1].append(v2)
    graph[v2].append(v1)
}

func dfs(_ node: Int) {
    for nextNode in graph[node] {
        if parents[nextNode] == -1 {
            parents[nextNode] = node
            dfs(nextNode)
        }
    }
}

func bfs() {
    var index = 0
    var queue = [1, 0]

    while queue.count > index {
        let node = queue[index]

        for nextNode in graph[node] {
            if parents[nextNode] == -1 {
                parents[nextNode] = node
                queue.append(nextNode)
            }
        }

        index += 1
    }
}

bfs()
//dfs(1)

print(parents[2...].map { String($0) }.joined(separator: "\n"))
