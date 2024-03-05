// 입력 받기
let numberOfNodes = Int(readLine()!)!
var childNodes = Array(repeating: [Int](), count: numberOfNodes)
let parentNodeIndices = readLine()!.split(separator: " ").map { Int(String($0))! }
let nodeToDelete = Int(readLine()!)!
var leafNodesCount = 0 // 리프 노드의 개수 카운트
var rootNodeIndex: Int? = nil // 루트 노드 인덱스

// 각 노드의 자식 노드 목록 생성
for (childIndex, parentIndex) in parentNodeIndices.enumerated() {
    if parentIndex == -1 {
        rootNodeIndex = childIndex
    } else {
        childNodes[parentIndex].append(childIndex)
    }
}

// 트리를 DFS 탐색하며 리프 노드 카운트
func dfs(_ currentNode: Int) {
    if currentNode == nodeToDelete { return } // 삭제할 노드에 도달하면 탐색 중지

    let currentChildren = childNodes[currentNode].filter { $0 != nodeToDelete }

    if currentChildren.isEmpty {
        leafNodesCount += 1 // 자식 노드가 없거나, 모든 자식이 삭제될 경우 리프 노드로 처리
        return
    }

    for childNode in currentChildren {
        dfs(childNode)
    }
}

// 루트 노드가 존재하고, 삭제할 노드가 루트 노드가 아닌 경우에만 DFS 탐색 시작
if let rootNodeIndex = rootNodeIndex, nodeToDelete != rootNodeIndex {
    dfs(rootNodeIndex)
} else if rootNodeIndex == nil || nodeToDelete == rootNodeIndex {
    leafNodesCount = 0 // 루트 노드가 삭제되면 리프 노드는 0개
}

print(leafNodesCount)
