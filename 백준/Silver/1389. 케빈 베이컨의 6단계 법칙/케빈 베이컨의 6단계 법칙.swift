let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var graph = Array(repeating: [Int](), count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

func bfs(_ start: Int) -> Int {
    var visited = Array(repeating: false, count: n + 1)
    var queue: [(Int, Int)] = [(start, 0)]
    var index = 0
    var result = 0

    visited[start] = true

    while queue.count > index {
        let (current, distance) = queue[index]

        index += 1

        result += distance

        for next in graph[current] {
            if !visited[next] {
                visited[next] = true
                queue.append((next, distance + 1))
            }
        }
    }

    return result
}

var answer = (index: 0, bacon: Int.max)

for i in 1...n {
    let bacon = bfs(i)

    if bacon < answer.bacon {
        answer = (i, bacon)
    }
}

print(answer.index)