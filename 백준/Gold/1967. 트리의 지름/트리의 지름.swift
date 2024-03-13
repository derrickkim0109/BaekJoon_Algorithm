let n = Int(readLine()!)!
var graph = Array(repeating: [(childNode: Int, cost: Int)](), count: n + 1)

for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let rootNode = input[0]
    let childNode = input[1]
    let cost = input[2]

    graph[rootNode].append((childNode: childNode, cost: cost))
    graph[childNode].append((childNode: rootNode, cost: cost))
}

func bfs(_ startNode: Int) -> (distance: Int, leaf: Int) {
    var visited = Array(repeating: false, count: n + 1)
    var maxDistance = 0
    var maxLeaf = 0

    visited[startNode] = true
    var queue: [(node: Int, cost: Int)] = [(startNode, 0)]
    var index = 0

    while queue.count > index {
        let (currentNode, currentDistance) = queue[index]

        index += 1

        if currentDistance >= maxDistance {
            maxDistance = currentDistance
            maxLeaf = currentNode
        }

        for (nextNode, nextDistance) in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append((nextNode, currentDistance + nextDistance))
            }
        }
    }
    return (maxDistance, maxLeaf)
}


let maxLeaf = bfs(1).leaf

print(bfs(maxLeaf).distance)
